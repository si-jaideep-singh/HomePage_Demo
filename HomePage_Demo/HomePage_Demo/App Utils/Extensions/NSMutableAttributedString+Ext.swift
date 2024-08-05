//
//  UILabel+Ext.swift
//  Lucknow Super Giants
//
//  Created by Valentine Miranda on 07/02/23.
//

import UIKit

extension NSMutableAttributedString {
    
    static func addAttributedText(text: String, textColor: AppColorName, textFont: UIFont.CustomFont, textSize: CGFloat) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.font : UIFont.customFont(customFont: textFont, size: textSize), NSAttributedString.Key.foregroundColor : UIColor.getAppColor(colorName: textColor)]

        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)

        return attributedString
    }
    
}
