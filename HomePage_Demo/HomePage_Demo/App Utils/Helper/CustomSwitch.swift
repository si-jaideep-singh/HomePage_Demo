//
//  CustomSwitch.swift
//  Lucknow Super Giants
//
//  Created by Tejas Kashid on 08/03/24.
//

import Foundation
import UIKit

class CustomSwitch: UISwitch {

    // Customize the appearance in the init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSwitch()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSwitch()
    }

    func setupSwitch() {
        // Customize background color
        self.backgroundColor = UIColor.lightGray

        // Customize border color and width
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.0

        // Customize the switch color
        self.tintColor = UIColor.white
        self.onTintColor = UIColor.green
    }
}
