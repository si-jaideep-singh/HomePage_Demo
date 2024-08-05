//
//  UIView+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 05/01/23.
//

import UIKit

extension UIView {
    func addVerticalGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.sublayers?.forEach({ layer in
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        })
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addVerticalGradient(firstColor: UIColor, secondColor: UIColor, thirdColor: UIColor, locations: [NSNumber]) {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.sublayers?.forEach({ layer in
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        })
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
    func roundCorners() {
        self.layer.cornerRadius = frame.size.width/2
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func applySketchShadow(
          color: UIColor = .black,
          alpha: Float = 0.2,
          x: CGFloat = 0,
          y: CGFloat = 2,
          blur: CGFloat = 4,
          spread: CGFloat = 0)
      {
          layer.shadowColor = color.cgColor
          layer.shadowOpacity = alpha
          layer.shadowOffset = CGSize(width: x, height: y)
          layer.shadowRadius = blur / 2
          if spread == 0 {
              layer.shadowPath = nil
          } else {
              let dx = -spread
              let rect = bounds.insetBy(dx: dx, dy: dx)
              layer.shadowPath = UIBezierPath(rect: rect).cgPath
          }
      }
    
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func addRoundedCorners(radius: CGFloat = 5) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}

extension CALayer {
    func roundBottomCorners(radius: CGFloat) {
        self.cornerRadius = radius
        self.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func roundTopCorners(radius: CGFloat) {
        self.cornerRadius = radius
        self.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
