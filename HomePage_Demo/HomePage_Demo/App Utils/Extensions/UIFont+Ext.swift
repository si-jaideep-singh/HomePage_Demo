//
//  UIFont+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 10/01/23.
//

import UIKit

extension UIFont {
    static func printFonts() {
        for family in UIFont.familyNames {
            let name = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font name: \(name)")
        }
    }
    
    enum CustomFont: String {
        case urbanistSemiBold = "Urbanist-SemiBold"
        case urbanistBold = "Urbanist-Bold"
        case robotoRegular = "Roboto-Regular"
        case robotoMedium = "Roboto-Medium"
        case robotoBold = "Roboto-Bold"
        case hindLight = "Hind-Light"
        case hindRegular = "Hind-Regular"
        case hindBold = "Hind-Bold"
        case hindMedium = "Hind-Medium"
        case hindSemibold = "Hind-SemiBold"
        var name: String {self.rawValue}
    }
    
    static func customFont(customFont font: CustomFont, size: CGFloat) -> UIFont {
        if let selectedCustomFont = UIFont(name: font.name, size: size) {
            return selectedCustomFont
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
