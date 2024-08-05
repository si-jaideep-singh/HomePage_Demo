//
//  CommonUtilities.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 04/01/23.
//

import UIKit
import Foundation
import SafariServices
import FirebaseAnalytics
import REIOSSDK
import FirebaseMessaging
final class CommonUtilities {
    static let shared = CommonUtilities()
    
//    func setRootController<T: UIViewController>(controller: T, storyboard: StoryboardNames) {
//        DispatchQueue.main.async {
//            let root_base_navigation_controller: RootBaseNavigationController = .instantiateController(storyboard: .storyboard_base)
//            root_base_navigation_controller.viewControllers = [controller.self]
//            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
//            sceneDelegate.window?.rootViewController = root_base_navigation_controller
//            sceneDelegate.window?.makeKeyAndVisible()
//        }
//    }
    
    func getBaseApiUrl() -> String {
        let baseUrl = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank)
        let apiVersionPath = (FirebaseModelConfig.sharedFirebaseConfig.baseApiVersionPath ?? .blank)
        return baseUrl + apiVersionPath
    }
    
    func getContentImagePathUrl(imagePath: String, imageName: String, imageWidth: String? = .blank, imageRatio: String? = nil) -> String {
        let baseUrl = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank)
        let contentImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0
        var firebaseContentImageUrl = (FirebaseModelConfig.sharedFirebaseConfig.baseContentImagePathUrl ?? .blank)
            .replacingOccurrences(of: SIParameterKeys.image_path.name, with: imagePath)
            .replacingOccurrences(of: SIParameterKeys.image_name.name, with: imageName)
            .replacingOccurrences(of: SIParameterKeys.content_image_version.name, with: "\(contentImageVersion)")
            .replacingOccurrences(of: SIParameterKeys.image_width.name, with: imageWidth ?? .blank)
        if imageRatio != nil {
            firebaseContentImageUrl = firebaseContentImageUrl.replacingOccurrences(of: SIParameterKeys.imgRatio.name, with: "/\(imageRatio ?? .blank)/")
        }
        return baseUrl + firebaseContentImageUrl
    }
    
    func getListingImageUrl(imagePath: String, imageName: String, imageWidth: String? = .blank, imageRatio: String? = nil) -> String {
        let baseUrl = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank)
        let contentImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0
        var firebaseContentImageUrl = (FirebaseModelConfig.sharedFirebaseConfig.baseContentImagePathUrl ?? .blank)
            .replacingOccurrences(of: SIParameterKeys.image_path.name, with: imagePath)
            .replacingOccurrences(of: SIParameterKeys.image_name.name, with: imageName)
            .replacingOccurrences(of: SIParameterKeys.content_image_version.name, with: "\(contentImageVersion)")
            .replacingOccurrences(of: SIParameterKeys.image_width.name, with: imageWidth ?? .blank)
        if imageRatio != nil {
            firebaseContentImageUrl = firebaseContentImageUrl.replacingOccurrences(of: SIParameterKeys.imgRatio.name, with: "/\(imageRatio ?? .blank)/")
        }
        return baseUrl + firebaseContentImageUrl
    }

    
    func getPlayerImagePath (_ playerId: String?) -> String? {
        let playerImagePath = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank) + (FirebaseModelConfig.sharedFirebaseConfig.basePlayerImagePath ?? .blank)
        let dataImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0.0
        let url = playerImagePath.replacingOccurrences(of: SIParameterKeys.player_id.name, with: playerId ?? .blank).replacingOccurrences(of: SIParameterKeys.data_image_version.name, with: "\(dataImageVersion)")
        return url
    }
    
    func getStaffImagePath (_ playerId: String?) -> String? {
        let playerImagePath = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank) + (FirebaseModelConfig.sharedFirebaseConfig.baseSupportStaffImagePath ?? .blank)
        let dataImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0.0
        let url = playerImagePath.replacingOccurrences(of: SIParameterKeys.staff_id.name, with: playerId ?? .blank).replacingOccurrences(of: SIParameterKeys.data_image_version.name, with: "\(dataImageVersion)")
        return url
    }
    func getbannerUrl (api: String) -> URL? {
        let baseUrl = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank)
        let dataImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0.0
        let url = baseUrl + api.replacingOccurrences(of: SIParameterKeys.data_image_version.name, with: "\(dataImageVersion)")
        return URL(string: url)
    }
    
    func displayDateFrom(dateString: String, currentFormat: LSGDateFormats, requiredFormat: LSGDateFormats) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = currentFormat.rawValue
        let formattedDate = formatter.date(from: dateString.replacingOccurrences(of: "+5:30", with: "+05:30"))
        
        formatter.dateFormat = requiredFormat.rawValue
        if let formattedDate = formattedDate {
            return formatter.string(from: formattedDate)
        }
        return .blank
    }
   
    func getTeamFlagUrl(teamID: String) -> String {
       let baseUrl = FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank
        var url = FirebaseModelConfig.sharedFirebaseConfig.baseTeamImagePath ?? .blank
        url = url.replacingOccurrences(of: SIParameterKeys.teamID.rawValue, with: teamID)
        url = baseUrl + url
        return url
    }
    
    func getNationalityFlagImagePath(_ countryCode: String?) -> String? {
        let playerImagePath =  (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank) + (FirebaseModelConfig.sharedFirebaseConfig.baseNationalityImagePath ?? .blank)
     
        let dataImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0.0
        let url = playerImagePath.replacingOccurrences(of: SIParameterKeys.nationality_id.name, with: countryCode ?? .blank).replacingOccurrences(of: SIParameterKeys.data_image_version.name, with: "\(dataImageVersion)")
        return url
    }
    
    func getCountryCodeImagePath(_ countryCode: String?) -> String? {
        let playerImagePath = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank) + (FirebaseModelConfig.sharedFirebaseConfig.baseCountryCodeImagePath ?? .blank)
     //   let dataImageVersion = FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion ?? 0.0

        let url = playerImagePath.replacingOccurrences(of: SIParameterKeys.nationality_id.name, with: countryCode ?? .blank)
        return url
    }
    
    func generateSharingUrl(entityCategory: String, titleAlias: String) -> String {
        let baseUrl = FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank
        var generatedSharing = baseUrl + (FirebaseModelConfig.sharedFirebaseConfig.contentSharingUrl ?? .blank)
        generatedSharing = generatedSharing.replacingOccurrences(of: SIParameterKeys.entity_category.name, with: entityCategory)
            .replacingOccurrences(of: SIParameterKeys.title_alias.name, with: titleAlias)
        return generatedSharing
    }
    
    func getApiBaseUrlCaptcha() -> String {
        var baseUrl = FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank
        return baseUrl
    }

    
    func displayDateForNewDesign(dateString: String, currentFormat: LSGDateFormats, requiredFormat: LSGDateFormats) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = currentFormat.rawValue
        let formattedDate = formatter.date(from: dateString.replacingOccurrences(of: "+5:30", with: "+05:30"))
        
        formatter.dateFormat = requiredFormat.rawValue
        if let formattedDate = formattedDate {
            return formatter.string(from: formattedDate)
        }
        return .blank
    }
    
    func formatVideoDuration(duration: String) -> String {
        let interval = Int(duration)
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        if let interval = interval {
            let formattedString = formatter.string(from: TimeInterval(interval)) ?? .blank
            return formattedString
        } else {
            return .blank
        }
    }
    
    func setPlayerName(firstName: String, lastName: String) -> NSAttributedString {
        let attrString = NSMutableAttributedString(string: firstName,
                                                   attributes: [NSAttributedString.Key.font: UIFont.customFont(customFont: .hindMedium, size: 22)])
        
        attrString.append(NSMutableAttributedString(string: " \(lastName)",
                                                    attributes: [NSAttributedString.Key.font: UIFont.customFont(customFont: .hindBold, size: 22)]))
        return attrString
    }
    
    func imageToBase64(_ image: UIImage) -> String {
        return image.jpegData(compressionQuality: 0.5)?.base64EncodedString() ?? .blank
    }
    
    func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    func getCodableObjectFromString<T: Codable>(text: String, type: T.Type) -> T? {
        let data = Data(text.utf8)
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            debugPrint("Error Decoding Codable Model: \(T.self)")
            return nil
        }
    }
//    
//    func getSquadListing() -> [ProfileDetailsModel]? {
//        let squadModelData = try? UserDefaultsManager.shared.getCodableObject(
//            object: SquadModel.self,
//            forKey: .squadModel)
//        
//        if let squadPlayerListing = squadModelData?.players?.first?.playerDetails {
//            return squadPlayerListing.sorted(by: {$0.name ?? .blank < $1.name ?? .blank})
//        }
//        return []
//    }
//    
//    func setViewControllerForNotification <T: UIViewController> (controllers: [T]) {
//        DispatchQueue.main.async {
//            let rootBaseNavigationController: RootBaseNavigationController = .instantiateController(storyboard: .storyboard_base)
//            rootBaseNavigationController.viewControllers = controllers
//            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
//            sceneDelegate.window?.rootViewController = rootBaseNavigationController
//            sceneDelegate.window?.makeKeyAndVisible()
//        }
//    }
    // MARK: - Google Analytics
//    class func trackScreenName(screenName: String, screenClass: String) {
//        Analytics.logEvent(AnalyticsEventScreenView,
//                           parameters: [
//                            AnalyticsParameterScreenName: screenName,// home
//                            AnalyticsParameterScreenClass: screenClass// vc
//                           ])
//    }
//    
//    class func trackEvent(eventName: String, parameters: [String: Any]?) {
//        Analytics.logEvent(eventName, parameters: parameters)
//    }
    // MARK: - Resulticks Events
    //Removed Resulticks code for 15th March 2024 release
//    class func resulticksCustomEvents(eventName: String, data: [String:Any]) {
//        REiosHandler.addEvent(eventName, data: data)
//    }
}

extension CommonUtilities {
    func getAppBundleVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "" }
        return version
//        let appVersion = Int(Double(version) ?? 0.0)
//        return appVersion
    }
    
    func getDeviceName() -> String {
        return UIDevice.current.name
    }
    
    func getDeviceOSVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getDeviceId() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    func getAppName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else { return "" }
        if let appName: String = dictionary["CFBundleName"] as? String {
            return appName
        }
        return "Lucknow Super Giants"
    }
}

//extension CommonUtilities {
//    func saveUserData(_ data: UserResponseData?){
//        guard let userData = data else {return}
//        let userModelData = SaveUserData(
//            firstName: userData.user?.first_name,
//            lastName: userData.user?.last_name,
//            email: userData.user?.social_user_image ?? .blank,
//            mobileNumber: userData.user?.mobile_no ?? .blank,
//            userImageUrl: userData.email_id ?? .blank
//        )
//        UserDefaultsManager.shared.setUserGuid(userGuid: data?.user_guid)
//        UserDefaultsManager.shared.setUserEmailId(userEmailId: data?.email_id ?? .blank)
//        UserDefaultsManager.shared.setWafUserGuid(wafuserGuid: data?.waf_user_guid)
//        try? UserDefaultsManager.shared.setCodableObject(object: userModelData, forKey: .registerUserData)
//    }
//}

//MARK: Notification Redirection
//extension CommonUtilities {
//    
//    func notificationRedirection(_ response: UNNotificationResponse?){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
//            if let userInfo = response?.notification.request.content.userInfo as? [String: Any]{
//                print("UserInfo : \(userInfo)")
//               // let eventType = userInfo["asset_type"] as? Int
//                let eventType = (userInfo["aps"] as? [String : Any])?["asset_type"] as? String
//                let root_tabbar_controller: RootBaseTabbarController = .instantiateController(storyboard: .storyboard_base)
//                switch eventType {
//                //Event type = 49 (App Landing Page)
//                case "49":
//                    CommonUtilities.shared.setRootController(controller: root_tabbar_controller, storyboard: .storyboard_base)
//                //Event type = 46 (News Listing)
//                case "46":
//                    let newsListingVC: NewsViewController = .instantiateController(storyboard: .storyboard_news)
//                    CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, newsListingVC])
//                //Event type = 1 (News Detail)
//                case "1":
//                    let newsDetailVC: NewsDetailsViewController = .instantiateController(storyboard: .storyboard_news)
//                    if let title = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String{
//                        newsDetailVC.viewModel.newsTitleAlias = title
//                        CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, newsDetailVC])
//                    }
//                //Event type = 47 (Photos Listing)
//                case "47":
//                    let photosListingVC: PhotosViewController = .instantiateController(storyboard: .storyboard_photos)
//                    CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, photosListingVC])
//                //Event type = 3 (Photos Detail)
//                case "3":
//                    let photoDetailVC: PhotosDetailViewController = .instantiateController(storyboard: .storyboard_photos)
//                    if let title = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String {
//                        photoDetailVC.viewModel.titleAlias = title
//                        CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, photoDetailVC])
//                    }
//                //Event type = 48 (Videos Listing)
//                case "48":
//                    let videoListingVC: VideosViewController = .instantiateController(storyboard: .storyboard_videos)
//                    CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, videoListingVC])
//                //Event type = 4 (Videos Detail)
//                case "4":
//                    let videoDetailVC: VideosDetailViewController = .instantiateController(storyboard: .storyboard_videos)
//                    if let title = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String {
//                        videoDetailVC.viewModel.videoTitleAlias = title
//                        CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, videoDetailVC])
//                    }
//                //Event Type = 43 (Standings)
//                case "43" :
//                    let standingVC: StandingsViewController = .instantiateController(storyboard: .storyboard_Standings)
//                    if let title = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String {
//                        standingVC.viewModel.standingTitleAlias = title
//                        CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, standingVC])
//                    }
//                    //Event Type = (Squad)
//                    case "18" :
//                        let squadVC: SquadViewController = .instantiateController(storyboard: .storyboard_squad)
//                        if let title = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String {
//                            squadVC.viewModel.squadTitleAlias = title
//                            CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, squadVC])
//                        }
//                //Live Match
//                case "41":
//                    self.openWebviewForLiveMatch(userInfo)
//                case "45":
//                    self.openWebview(userInfo)
//                default:
////                    self.openWebview(userInfo)
//                    let homeVC: HomeViewController = .instantiateController(storyboard: .storyboard_home)
//                    CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, homeVC])
//                    
//                }
//            }
//        }
//    }
//    
//    fileprivate func openWebview(_ userInfo: [String: Any]){
//        let root_tabbar_controller: RootBaseTabbarController = .instantiateController(storyboard: .storyboard_base)
//        var webviewURL = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String
//        var requiredLogin: Bool = false
//        
//        if let item = FirebaseModelConfig.sharedFirebaseConfig.appMenu.first(where: { $0.menuID == .other }) {
//        let isLoginText = "islogin=true"
//        requiredLogin = webviewURL?.contains(isLoginText) ?? false
//            
//            if item.isWebview == true && item.inAppBrowser == true {
//                let commonWebVC: CommonWebviewVC = .instantiateController(storyboard: .storyboard_common)
//                let snippet = webviewURL ?? ""
//                var webTitle = ""
//                if let range = snippet.range(of: "display_title=") {
//                    let title = snippet[range.upperBound...]
//                    print(title) // prints "123.456.7891"
//                    webTitle = String(title)
//                }
//                commonWebVC.webviewTitle = webTitle
//                commonWebVC.webViewUrl = webviewURL
//                commonWebVC.isLogin = requiredLogin
//                commonWebVC.isWebAuth = requiredLogin
//                if requiredLogin {
//                    if UserDefaultsManager.shared.getuserLogin()  {
//                        CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, commonWebVC])
//                    } else {
//                        (UIApplication.shared.delegate as? AppDelegate)?.openWebView = commonWebVC
//                        let loginVC: LoginViewController = .instantiateController(storyboard: .storyboard_login)
//    //                    loginVC.showNavigationBar = true
//                        CommonUtilities.shared.setViewControllerForNotification(controllers: [loginVC])
//                    }
//                } else {
//                    CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, commonWebVC])
//                }
//                
//            } else if item.isWebview == true && item.isExternalWebview == true {
//                let url = URL(string: .blank)!
//                let safariVC = SFSafariViewController(url: url)
//               // safariVC.preferredBarTintColor = .getAppColor(appColorName: .purple_7155BA)
//                let rootBaseNavigationController: RootBaseNavigationController = .instantiateController(storyboard: .storyboard_base)
//                rootBaseNavigationController.viewControllers = [root_tabbar_controller]
//                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
//                sceneDelegate.window?.rootViewController = rootBaseNavigationController
//                sceneDelegate.window?.rootViewController?.present(safariVC, animated: true, completion: nil)
//                sceneDelegate.window?.makeKeyAndVisible()
//            }
//        }
//    }
//    
//    fileprivate func openWebviewForLiveMatch(_ userInfo: [String: Any]) {
//        let root_tabbar_controller: RootBaseTabbarController = .instantiateController(storyboard: .storyboard_base)
//        let matchId = (userInfo["aps"] as? [String : Any])?["asset_url"] as? String
//        if let matchObject = FirebaseModelConfig.sharedFirebaseConfig.matchCenterConfig?.first(where: { $0.matchID == matchId }) {
//            let commonWebVC: CommonWebviewVC = .instantiateController(storyboard: .storyboard_common)
//            commonWebVC.webviewTitle = matchObject.title
//            commonWebVC.webViewUrl = matchObject.webviewURL
//            CommonUtilities.shared.setViewControllerForNotification(controllers: [root_tabbar_controller, commonWebVC])
//        }
//    }
//    
//    func getFCMToken() -> String?  {
//        if let token = Messaging.messaging().fcmToken {
//            return token
//        } else {
//            print("FCM token not available yet")
//            return nil
//        }
//    }
//    
//}
