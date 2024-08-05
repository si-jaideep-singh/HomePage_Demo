//
//  ButtonWithRightIcon.swift
//  Lucknow Super Giants
//
//  Created by Siddhesh Jadhav on 07/02/23.
//

import UIKit

class ButtonWithRightIcon: UIButton {
    override func imageRect(forContentRect contentRect:CGRect) -> CGRect {
        var imageFrame = super.imageRect(forContentRect: contentRect)
        imageFrame.origin.x = super.titleRect(forContentRect: contentRect).maxX - (imageFrame.width - 2)
        return imageFrame
    }
    
    override func titleRect(forContentRect contentRect:CGRect) -> CGRect {
        var titleFrame = super.titleRect(forContentRect: contentRect)
        if (self.currentImage != nil) {
            titleFrame.origin.x = super.imageRect(forContentRect: contentRect).minX - 2
        }
        return titleFrame
    }
}
