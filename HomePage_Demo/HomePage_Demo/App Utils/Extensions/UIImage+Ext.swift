//
//  UIImage+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 06/12/22.
//

import UIKit

extension UIImage {
    static func getAppImage(imageName: AppImagesName) -> UIImage {
        return UIImage(named: imageName.name) ?? UIImage()
    }
    
    static func getAppBackgroundImage(imageName: AppBackgroundImageName) -> UIImage {
        return UIImage(named: imageName.name) ?? UIImage()
    }
    
//    static func getAppGradientAssetImage(gradientAssetName: AppGradientAssetName) -> UIImage {
//        return UIImage(named: gradientAssetName.name) ?? UIImage()
//    }
//    
//    static func getAppTestAssetImage(testAssetImageName: AppTestAssetsName) -> UIImage {
//        return UIImage(named: testAssetImageName.name) ?? UIImage()
//    }
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    static func getNavigationBarAssetImage(_ image: NavigationBarAssetImages) -> UIImage {
        return UIImage(named: image.name) ?? UIImage()
    }
}
