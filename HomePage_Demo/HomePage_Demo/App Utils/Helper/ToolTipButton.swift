//
//  ToolTipButton.swift
//  Lucknow Super Giants
//
//  Created by Valentine Miranda on 16/02/23.
//

import UIKit
import EasyTipView

class ToolTipButton: UIButton {
    
    weak var withinSuperview: UIView?
    private var tipView: EasyTipView?
    public var tipViewText: String?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupEasyTipView()
        self.addTarget(self, action: #selector(tooltipAction), for: .touchUpInside)
    }
    
    public func setupTip(text: String?, withinSuperview: UIView?) {
        self.tipViewText = text
        self.withinSuperview = withinSuperview
    }
    
    private func setupEasyTipView() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.foregroundColor = .black
        preferences.drawing.backgroundColor = .white
        preferences.animating.dismissOnTap = true
        EasyTipView.globalPreferences = preferences
    }
    
    @objc func tooltipAction() {
        if let tipView = tipView {
            tipView.dismiss()
            self.tipView = nil
        } else {
            guard let tipViewText = tipViewText else { return }
            tipView = EasyTipView(text: tipViewText)
            tipView?.show(forView: self, withinSuperview: self.withinSuperview)
        }
    }
    
}
