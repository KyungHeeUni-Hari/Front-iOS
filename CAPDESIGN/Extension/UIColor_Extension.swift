//
//  UIColor_Extension.swift
//  Archive
//
//  Created by 이수현 on 1/8/25.
//

import UIKit

extension UIColor {
    // Hex 문자열을 UIColor로 변환하는 메서드
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        // Hex 문자열 길이에 따라 RGB 값을 추출
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        // UIColor 초기화
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// Example
// let buttonColor = UIColor(hex: "#314B9E")



extension UIColor {
    // Rock Color
    static let rock_100 = UIColor(hex: "EE2201")
    static let rock_90 = UIColor(hex: "F0391B")
    static let rock_70 = UIColor(hex: "F4654E")
    static let rock_60 = UIColor(hex: "F57A67")
    static let rock_40 = UIColor(hex: "F8A799")
    
    // Indie Color
    static let indie_100 = UIColor(hex: "FFDD11")
    static let indie_90 = UIColor(hex: "FFE129")
    static let indie_70 = UIColor(hex: "FFE859")
    static let indie_60 = UIColor(hex: "FFEB70")
    static let indie_40 = UIColor(hex: "FFF1A0")

    // K-pop Color
    static let kPop_100 = UIColor(hex: "00DE01")
    static let kPop_90 = UIColor(hex: "1AE21B")
    static let kPop_70 = UIColor(hex: "4DE84E")
    static let kPop_60 = UIColor(hex: "66EB67")
    static let kPop_40 = UIColor(hex: "99F299")
    
    // J-pop Color
    static let jPop_100 = UIColor(hex: "23EEFF")
    static let jPop_90 = UIColor(hex: "39F0FF")
    static let jPop_70 = UIColor(hex: "65F4FF")
    static let jPop_60 = UIColor(hex: "7BF5FF")
    static let jPop_40 = UIColor(hex: "A7F8FF")
    
    // R&B Color
    static let RnB_100 = UIColor(hex: "0265FE")
    static let RnB_90 = UIColor(hex: "1C75FF")
    static let RnB_70 = UIColor(hex: "4E94FF")
    static let RnB_60 = UIColor(hex: "67A3FE")
    static let RnB_40 = UIColor(hex: "9AC1FF")
    
    // Dance Color
    static let dance_100 = UIColor(hex: "FF54EE")
    static let dance_90 = UIColor(hex: "FF66F0")
    static let dance_70 = UIColor(hex: "FF88F4")
    static let dance_60 = UIColor(hex: "FF98F5")
    static let dance_40 = UIColor(hex: "FFBBF8")
    
    // Hip hop Color
    static let hiphop_100 = UIColor(hex: "FF620D")
    static let hiphop_90 = UIColor(hex: "FF7226")
    static let hiphop_70 = UIColor(hex: "FF9256")
    static let hiphop_60 = UIColor(hex: "FFA16E")
    static let hiphop_40 = UIColor(hex: "FFC09E")


    // Custom Black
    static let black_100 = UIColor(hex: "191817")
    static let black_70 = UIColor(hex: "2D2D2C")
    static let black_35 = UIColor(hex: "454444")
    static let black_20 = UIColor(hex: "4F4F4F")
    static let black_10 = UIColor(hex: "555555")
    
    // CustimWhite
    static let white_70 = UIColor.white.withAlphaComponent(0.7)
    static let white_35 = UIColor.white.withAlphaComponent(0.35)
    static let white_10 = UIColor.white.withAlphaComponent(0.1)
    
    // Login
    static let alertRed = UIColor(hex: "#FF483B")
    static let alertRedGreen = UIColor(hex: "#2BD918")
    
    //genre
    static let Pop = UIColor(hex: "#FF54EE")      
    static let HipHop = UIColor(hex: "#0265FE")
    static let Afrobeats = UIColor(hex: "#DAA520")
    static let Ballad = UIColor(hex: "#8B4513")
    static let Disco = UIColor(hex: "#B0C4DE")
    static let Electronic = UIColor(hex: "#00DE01")
    static let Funk = UIColor(hex: "#FF620D")
    static let Indie = UIColor(hex: "#23EEFF")
    static let Jazz = UIColor(hex: "#FFDD11")
    static let Latin = UIColor(hex: "#EE2201")
    static let Phonk = UIColor(hex: "#093E90")
    static let Punk = UIColor(hex: "#FF1493")
    static let Rock = UIColor(hex: "#FF7F50")
    static let Trot = UIColor(hex: "#29F2D0")
    static let Other = UIColor(hex: "#EEFEFF")

}
// Example
// let buttonColor = .lightOrange // Hex: #FFFDF3
// let backgroundColor = UIColor.Orange // Hex: #FFD880


extension UIColor {
    /// 보색 반환
    var complementaryColor: UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1.0
        
        // UIColor를 RGBA 값으로 변환
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // RGB 값을 반전
        let invertedRed = 1.0 - red
        let invertedGreen = 1.0 - green
        let invertedBlue = 1.0 - blue
        
        // 보색 반환
        return UIColor(red: invertedRed, green: invertedGreen, blue: invertedBlue, alpha: alpha)
    }
}
