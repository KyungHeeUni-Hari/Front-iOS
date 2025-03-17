//
//  UIScreen_Extension.swift
//  Archive
//
//  Created by 송재곤 on 1/9/25.
//

import UIKit

extension UIScreen {
    /// - Mini, SE: 375.0
    /// - pro: 390.0
    /// - pro max: 428.0
    var isWiderThan375pt: Bool { self.bounds.size.width > 375 }
    var screenWidth: CGFloat {
            return self.bounds.width
        }
    var screenHeight: CGFloat {
        return self.bounds.height
        }
    
}
