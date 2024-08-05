//
//  UIDevice+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 20/04/22.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension UIScreen {
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
}
