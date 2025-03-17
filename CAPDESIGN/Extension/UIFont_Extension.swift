//
//  UIFont_Extension.swift
//  Archive
//
//  Created by 이수현 on 1/8/25.
//

import UIKit

public enum CustomFont {
    case SFPro
}


extension UIFont {
    class func customFont(font: CustomFont, ofSize size: CGFloat, rawValue: Int) -> UIFont {
        switch (font, rawValue) {
        case (.SFPro, 700):
            return UIFont(name: "SFProText-Bold", size: size) ?? .systemFont(ofSize: size)
        case (.SFPro, 590):
            return UIFont(name: "SFProText-Semibold", size: size) ?? .systemFont(ofSize: size)
        case (.SFPro, 510):
            return UIFont(name: "SFProText-Medium", size: size) ?? .systemFont(ofSize: size)
        case (.SFPro, 400):
            return UIFont(name: "SFProText-Regular", size: size) ?? .systemFont(ofSize: size)
        case (.SFPro, 274):
            return UIFont(name: "SFProText-Light", size: size) ?? .systemFont(ofSize: size)
 
        default:
            return .systemFont(ofSize: size)
        }
    }
}

/* Example
 
 let label = UILabel().then { lbl in
     lbl.text = "폰트 확인용"
     lbl.font = .customFont(font: .SFPro, ofSize: 15, rawValue: 700)
     lbl.textColor = .black
 }
 
 */
