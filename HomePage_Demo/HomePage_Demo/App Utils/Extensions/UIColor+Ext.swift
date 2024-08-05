//
//  UIColor+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 03/01/23.
//

import UIKit

extension UIColor {
    static func getAppColor(colorName: AppColorName) -> UIColor {
        return UIColor(named: colorName.name) ?? .clear
    }
    
//    static var lsg_opaque_white_ffffff_20: UIColor {
//        return UIColor(named: AppColorName.opaque_white_ffffff_20.rawValue) ?? .clear
//    }
//    
//    static var lsg_opaque_white_ffffff_40: UIColor {
//        return UIColor(named: AppColorName.opaque_white_ffffff_40.rawValue) ?? .clear
//    }
//    
//    static var lsg_opaque_white_ffffff_60: UIColor {
//        return UIColor(named: AppColorName.opaque_white_ffffff_60.rawValue) ?? .clear
//    }
//    
//    static var lsg_red: UIColor {
//        return UIColor(named: AppColorName.red_FF3743.name) ?? .clear
//    }
}
