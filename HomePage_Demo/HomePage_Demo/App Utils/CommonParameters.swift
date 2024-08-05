//
//  CommonParameters.swift
//  Lucknow Super Giants
//
//  Created by Valentine Miranda on 09/02/23.
//

import Foundation

struct CommonParameter {
    static let isApp = "1"
    static let platformVersion = CommonUtilities.shared.getAppBundleVersion()
    static let platformType = 3
    static let deviceName = CommonUtilities.shared.getDeviceName()
    static let userType = (UserDefaultsManager.shared.getuserLogin() == true) ? 3 : 1
    
    static let deviceOSVersion = CommonUtilities.shared.getDeviceOSVersion()
    static let OS_Type = "IOS"
    static let appName = CommonUtilities.shared.getAppName()
    static let appVersion = CommonUtilities.shared.getAppBundleVersion()
    static let deviceType = CommonUtilities.shared.getDeviceName()
    static let deviceId = CommonUtilities.shared.getDeviceId()
    
    static let installId = ""
    static let pushToken = ""
    
    static let pushFlag = true
    
    
}
