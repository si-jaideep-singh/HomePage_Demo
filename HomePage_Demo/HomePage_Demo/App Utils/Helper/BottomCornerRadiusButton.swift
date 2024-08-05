//
//  BottomCornerRadiusButton.swift
//  Sportz_interactive_LSG_App
//
//  Created by Valentine Miranda on 30/01/23.
//

import UIKit

class BottomCornerRadiusButton: UIButton {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBottomCornerRadius()
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 0
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupBottomCornerRadius() {
        //self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
    }
}

class BorderWithBottomCornerRadiusButton: BottomCornerRadiusButton {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBorders()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupBorders() {
        self.layer.borderColor = UIColor.getAppColor(colorName: .orange_F18700).cgColor
        self.layer.borderWidth = 2
    }
}

