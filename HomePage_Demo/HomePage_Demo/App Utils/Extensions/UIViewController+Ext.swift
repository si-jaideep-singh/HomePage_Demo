//
//  UIViewController+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 05/12/22.
//

import UIKit

extension UIViewController {
    static func instantiateController<T: UIViewController>(storyboard: StoryboardNames) -> T {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: nil)
        let controller = (storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T)!
        return controller
    }
}
extension UIView {
    func addBorderAndRadius(width: CGFloat? = 0, borderColour: UIColor? = .clear, cornerRadius: CGFloat) {
        self.layer.borderWidth = width ?? 0
        self.layer.borderColor = borderColour?.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    func addBorderAndCornerRadius(width: CGFloat = 0,
                                  borderColour: UIColor? = .clear,
                                  corners: CACornerMask,
                                  cornerRadius: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColour?.cgColor
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}

extension UIColor {
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}
