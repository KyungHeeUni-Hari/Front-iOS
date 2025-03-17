//
//  UIImageView_Extension.swift
//  Archive
//
//  Created by 이수현 on 1/21/25.
//

import UIKit

extension UIImageView {
    // 이미지의 평균 색상 계산 후 반환
    func avgImageColor() -> UIColor? {
        // UIImage를 Core Image의 CIImage로 변환
        guard let image = self.image, let inputImage = CIImage(image: image) else {
            print("inputImage nil")
            return nil
        }
        
        // 이미지 전체 영역을 벡터로 정의
        let extentVector = CIVector(x: inputImage.extent.origin.x,
                                    y: inputImage.extent.origin.y,
                                    z: inputImage.extent.size.width,
                                    w: inputImage.extent.size.height)
        
        // 주어진 이미지의 특정 영역의 평균 색상을 계산
        // kCIInputImageKey: 입력 이미지.
        // kCIInputExtentKey: 평균을 계산할 영역(여기서는 전체 이미지)
        // 평균: CIAreaAverage
        // 가장 많이 보이는 색: CIAreaMaximum
        guard let filter = CIFilter(name: "CIAreaAverage",
                                    parameters: [
                                        kCIInputImageKey: inputImage,
                                        kCIInputExtentKey: extentVector
                                    ])
        else {
            print("filter nil")
            return nil
        }
        
        // 필터를 실행한 후의 결과 이미지
        guard let outPutImage = filter.outputImage else {
            print("outPutImage nil")
            return nil
        }
        
        // RGB, Alpha 배열
        var bitmap = [UInt8](repeating: 0, count: 4)
        
        // Core Image 작업을 처리하기 위한 컨텍스트
        // workingColorSpace를 kCFNull로 설정하여 색상 공간을 비활성화
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        
        // 평균 색상을 bitmap 배열에 저장
        // rowBytes: 4: 한 행당 4바이트씩 저장 (RGBA 각 1바이트)
        // bounds: (0, 0, 1, 1)로 설정하여 1x1 크기의 결과만 추출
        context.render(outPutImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        
        // bitmap 배열의 RGBA 값을 각각 255로 나누어 UIColor로 변환
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
    
    
    // 검정색과 흰색을 제외한 가장 많이 보이는 색 추출
    func mostFrequentColor(excludeWhiteAndBlack: Bool = true) -> UIColor? {
        guard let image = self.image, let cgImage = image.cgImage else { return nil }
        let width = cgImage.width
        let height = cgImage.height
        
        // 1. 이미지 데이터를 가져오기 위한 설정
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let totalBytes = height * bytesPerRow
        
        var rawData = [UInt8](repeating: 0, count: totalBytes)
        guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB) else { return nil }
        guard let context = CGContext(data: &rawData,
                                      width: width,
                                      height: height,
                                      bitsPerComponent: 8,
                                      bytesPerRow: bytesPerRow,
                                      space: colorSpace,
                                      bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else { return nil }
        
        // 2. 이미지 데이터 렌더링
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        // 3. 색상 빈도 분석
        var colorCount: [UIColor: Int] = [:]
        for y in 0..<height {
            for x in 0..<width {
                let pixelIndex = (y * bytesPerRow) + (x * bytesPerPixel)
                let red = CGFloat(rawData[pixelIndex]) / 255.0
                let green = CGFloat(rawData[pixelIndex + 1]) / 255.0
                let blue = CGFloat(rawData[pixelIndex + 2]) / 255.0
                let alpha = CGFloat(rawData[pixelIndex + 3]) / 255.0
                
                // 알파가 너무 낮은 픽셀은 제외
                guard alpha > 0.1 else { continue }
                
                // 흰색과 검은색 제외
                if excludeWhiteAndBlack {
                    let isWhite = red > 0.9 && green > 0.9 && blue > 0.9
                    let isBlack = red < 0.1 && green < 0.1 && blue < 0.1
                    if isWhite || isBlack { continue }
                }
                
                let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                colorCount[color, default: 0] += 1
            }
        }
        
        // 4. 가장 많이 등장한 색상 반환
        return colorCount.max(by: { $0.value < $1.value })?.key
    }
}


// https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximum
