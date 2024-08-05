//
//  RRUserDefaultsManager.swift
//  Rajasthan Royals
//
//  Created by Ajinkya Sonar on 13/12/22.
//

import Foundation

struct SaveUserData: Codable {
    var firstName: String? = .blank
    var lastName: String? = .blank
    var email: String? = .blank
    var mobileNumber: String? = .blank
//    var userId: String? = .blank
//    var isProfileComplete: Bool? = false
    var userImageUrl: String = .blank
//    var isEmailVerified: String = .blank
//    var isMobileVerified: String = .blank
}

public enum UserDefaultKeys: String, CaseIterable {
    case appInstall
    case isUserLoggedIn
    case registerUserData
    case userToken
    case loginType
    case accountDeleted
    case socialResponseModel
    case userGuid
    case wafUserGuid
    case userType
    case captcha
    case skipLogin
    case notificationSubscribed
    case profileImgURL
    case squadModel = "squadModel"
    case favPlayerSetCount

    case fcmToken
    case getProfileResponse = "getProfileResponse"
    case userEmailId
    case userRewardPoints

    var name: String {self.rawValue}
}

public final class UserDefaultsManager: UserDefaults {
    public static let shared = UserDefaultsManager()
    let userdefaults = UserDefaults.standard
    
    /// Sets Json Formatted Data in User Defaults
    /// - Parameters:
    ///   - object: Any Object Confirming to Codable Protocol
    ///   - forKey: Key Corresponding to object to be saved
    func setCodableObject<T:Codable>(object: T, forKey: UserDefaultKeys) throws {
        let jsonData = try JSONEncoder().encode(object)
        set(jsonData, forKey: forKey.name)
    }
    
    /// Gets Json Formatted Data Stored in User Defaults
    /// - Parameters:
    ///   - object: Any Object Confirming to Codable Protocol
    ///   - forKey: Key Corresponding to object saved
    /// - Returns: Json Formatted Data for Saved Codable Object.
    func getCodableObject<T:Codable>(object: T.Type, forKey: UserDefaultKeys) throws -> T? {
        guard let result = value(forKey: forKey.name) as? Data else {
            return nil
        }
        return try? JSONDecoder().decode(object, from: result)
    }
    
    func setValue(value: Any?, forKey key: UserDefaultKeys) {
        userdefaults.set(value, forKey: key.rawValue)
    }
    
    func getValue(forKey key: UserDefaultKeys) -> Any? {
        userdefaults.value(forKey: key.rawValue)
    }
    
    func resetCodableObject(key: UserDefaultKeys) {
        userdefaults.removeObject(forKey: key.name)
    }
    
    func resetUserDefaults() {
        UserDefaultKeys.allCases.forEach { key in
            if key.rawValue != "deviceToken" {
                userdefaults.removeObject(forKey: key.name)
            }
        }
    }
    
    func setuserLogin(userLogIn: Bool) {
        userdefaults.set(userLogIn, forKey: UserDefaultKeys.isUserLoggedIn.rawValue)
    }

    func getuserLogin() -> Bool {
        return (userdefaults.value(forKey: UserDefaultKeys.isUserLoggedIn.rawValue) != nil) ? userdefaults.value(forKey: UserDefaultKeys.isUserLoggedIn.rawValue) as! Bool : false
    }
    
    func setUserGuid(userGuid: String?) {
        guard let userGuid = userGuid else { return }
        userdefaults.set(userGuid as String, forKey: UserDefaultKeys.userGuid.rawValue)
    }
    
    func setWafUserGuid(wafuserGuid: String?) {
        guard let wafuserGuid = wafuserGuid else { return }
        userdefaults.set(wafuserGuid as String, forKey: UserDefaultKeys.wafUserGuid.rawValue)
    }
    
    func getUserGuid() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.userGuid.rawValue) as? String
    }
    
    func getWafUserGuid() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.wafUserGuid.rawValue) as? String
    }
    
    func setUserToken(userToken: String) {
        userdefaults.set(userToken as String, forKey: UserDefaultKeys.userToken.rawValue)
    }
    
    func getUserToken() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.userToken.rawValue) as? String
    }
    
//    func setUserLoginType(type: LoginType) {
//        userdefaults.set(type.rawValue as String, forKey: UserDefaultKeys.loginType.rawValue)
//    }
    
    func getUserLoginType() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.loginType.rawValue) as? String
    }
    
    func setUserType(userType: UserType) {
        userdefaults.set(userType.rawValue as String, forKey: UserDefaultKeys.userType.rawValue)
    }
    
    func getUserType() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.userType.rawValue) as? String
    }
    
    func setUserSkipLogin(_ skipLogin: Bool) {
        userdefaults.set(skipLogin, forKey: UserDefaultKeys.skipLogin.rawValue)
    }
    
    func getUserSkipLogin() -> Bool {
        return (userdefaults.value(forKey: UserDefaultKeys.skipLogin.rawValue) != nil) ? userdefaults.value(forKey: UserDefaultKeys.skipLogin.rawValue) as! Bool : false
    }
    
    func setProfileImgURL(url: String?) {
        guard let url = url else { return }
        userdefaults.set(url as String, forKey: UserDefaultKeys.profileImgURL.rawValue)
    }
    
    func getProfileImgURL() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.profileImgURL.rawValue) as? String
    }
    
    func setUserFCMToken(userToken: String) {
        userdefaults.set(userToken as String, forKey: UserDefaultKeys.fcmToken.rawValue)
    }
    
    func getUserFCMToken() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.fcmToken.rawValue) as? String
    }
    
    func setSubcribeApi(isSubcribed: Bool) {
        userdefaults.set(isSubcribed as Bool, forKey: UserDefaultKeys.notificationSubscribed.rawValue)
    }
    
    func getSubcribeApi() -> Bool? {
        return (userdefaults.value(forKey: UserDefaultKeys.notificationSubscribed.rawValue) != nil) ? userdefaults.value(forKey: UserDefaultKeys.notificationSubscribed.rawValue) as! Bool : false
        
    }
    func setUserEmailId(userEmailId: String)  {
        userdefaults.set(userEmailId as String, forKey: UserDefaultKeys.userEmailId.rawValue)
    }
    func getUserEmailId() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.userEmailId.rawValue) as? String
    }
    
    func setUserRewardPoints(userPoints: String) {
        userdefaults.set(userPoints as String, forKey: UserDefaultKeys.userRewardPoints.rawValue)
    }
    
    func getUserRewardPoints() -> String? {
        return userdefaults.value(forKey: UserDefaultKeys.userRewardPoints.rawValue) as? String
    }
    
    func setUserFavPlayer(count: Int) {
        userdefaults.set(count as Int, forKey: UserDefaultKeys.favPlayerSetCount.rawValue)
    }
    
    func getUserFavPlayer() -> Int? {
        return userdefaults.value(forKey: UserDefaultKeys.favPlayerSetCount.rawValue) as? Int
    }
}
