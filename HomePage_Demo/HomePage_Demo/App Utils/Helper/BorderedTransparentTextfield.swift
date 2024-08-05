//
//  BorderedTransparentTextfield.swift
//  Sportz_interactive_LSG_App
//
//  Created by Valentine Miranda on 30/01/23.
//

import UIKit

class BorderedTransparentTextfield: UITextField {
    
    private var completion: (() -> ())?
    enum Style {
           case bordered
           case borderless
       }
       
    private var style: Style = .bordered
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextfieldLayer()
        setupTextfieldAttributes()
        if isSecureTextEntry {
            setupSecureInput()
        }
    }
    
    public func configureAs(_ style: Style) {
            self.style = style
            setupTextfieldLayer()
        }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupTextfieldLayer() {
//        self.layer.masksToBounds = true
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.getAppColor(colorName: .opaque_white_ffffff_20).cgColor  //UIColor.lsg_opaque_white_ffffff_20.cgColor
//        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
                if style == .bordered {
                    self.layer.borderWidth = 1
                    self.layer.borderColor = UIColor.getAppColor(colorName: .opaque_white_ffffff_20).cgColor
                    self.layer.cornerRadius = 5
                } else {
                    self.layer.borderWidth = 0 // No border
                    self.layer.borderColor = UIColor.clear.cgColor // No color
                    self.layer.cornerRadius = 0 // No corner radius
                }
    }
    
    private func setupTextfieldAttributes() {
        self.tintColor = .white
        self.textColor = .white
        self.backgroundColor = .clear
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.getAppColor(colorName: .opaque_white_ffffff_40)])
        
        self.autocorrectionType = .no
    }
    
    public func showAlertedMode() {
        self.layer.borderColor = UIColor.getAppColor(colorName: .red_FF0000).cgColor
        self.textColor = UIColor.red
        resetTextfield()
    }
    public func showAlertedModeForRegisterScreen() {
        self.layer.borderColor = UIColor.getAppColor(colorName: .red_FF0000).cgColor
        self.textColor = UIColor.white
       // resetTextfield()
    }
    
    public func resetTextfield() {
//        self.text = ""
        self.layer.borderColor = UIColor.getAppColor(colorName: .opaque_white_ffffff_20).cgColor
        self.textColor = UIColor.white
    }
    
    public func setupSecureInput() {
        self.isSecureTextEntry = true
        self.rightViewMode = .always
        let showPasswordButton = UIButton()
        showPasswordButton.setImage(.getAppImage(imageName: .hide_password_icon), for: .normal)
        showPasswordButton.addTarget(self, action: #selector(showPassword(_:)), for: .touchUpInside)
        self.rightView = showPasswordButton
    }
    
    public func setupDropdownIcon(completion: (() -> ())?) {
        self.completion = completion
        self.rightViewMode = .always
        let showPickerView = UIButton()
        showPickerView.setImage(.getAppImage(imageName: .squadDownArrow), for: .normal)
        showPickerView.imageView?.contentMode = .scaleAspectFit
        showPickerView.addTarget(self, action: #selector(performSelectorAction), for: .touchUpInside)
        self.rightView = showPickerView
    }
    
    public func setupCountryTextfield(completion: (() -> ())?) {
        self.layer.borderWidth = 0
        self.leftViewMode = .always
        
        let flagIcon = UIImageView()
        flagIcon.contentMode = .scaleAspectFit
        flagIcon.image = .getAppImage(imageName: .IND)
        
        self.leftView = flagIcon
        
        setupDropdownIcon(completion: completion)
    }
    
    public func setupVerifiedField() {
        self.rightViewMode = .always
        let image = UIImage.getAppImage(imageName: .radio_tick)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.rightView = imageView
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: bounds.height * 0.32, width: bounds.height * 0.45, height: bounds.height * 0.3)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.07
        let height = bounds.height * 0.8
        return CGRect(x: bounds.minX + width / 2, y: bounds.midY - height / 2, width: width, height: height)
    }
    
    @objc func showPassword(_ sender: UIButton) {
        if self.isSecureTextEntry == true{
            sender.setImage(.getAppImage(imageName: .show_password_icon), for: .normal)
        }else{
            sender.setImage(.getAppImage(imageName: .hide_password_icon), for: .normal)
        }
        self.isSecureTextEntry.toggle()
    }
    
    @objc func performSelectorAction() {
        completion?()
    }
}
