//
//  CommonEnums.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 25/01/23.
//

import Foundation

enum StoryboardNames: String {
    case storyboard_base = "Base"
    case storyboard_splash = "Splash"
    case storyboard_login = "Login"
    case storyboard_home = "Home"
    case storyboard_main = "Main"
    case storyboard_squad = "Squad"
    case storyboard_filter = "Filter"
    case storyboard_profile = "Profile"
    case storyboard_news = "News"
    case storyboard_videos = "Videos"
    case storyboard_squadDetail = "SquadDetail"
    case storyboard_more = "More"
    case storyboard_photos = "Photos"
    case storyboard_Standings = "Standings"
    case storyboard_common = "Common"
//    case storyboard_fixtures = "Fixtures"
    case notification = "Notification"
    case storyboard_fanLoyalty = "FanLoyaltyProgram"
    case storyboard_fixtures = "Fixtures"
    var name: String {self.rawValue}
}

enum AppColorName: String {
    case black_000000
    case blue_0156E1
    case darkBlue_101454
    case lightBlue_002868
    case darkBlue_00368D
    case darkBlue_072862
    case darkBlue_0039BD
    case darkblue_101E52
    case opaque_white_ffffff_20
    case opaque_white_ffffff_40
    case opaque_white_ffffff_60
    case orange_F18700
    case orange_F39225
    case red_FF3743
    case white_FFFFFF
    case yellow_F2C029
    case black_000000_50
    case blue_0B3888
    case blue_022464
    case blue_061C5D
    case blue_4270EC
    case blue_05153
    case green_3AAA35
    case red_FF0000
    case black_000000_20
    case black_000000_80
    case baseBlue_4089F2
    case blue_94AEFF
    case black_333333
    case black_1A1A1A
    case black_1B2027
    case black_999999
    case orange_85510D
    case grey_666666
    case grey_757575
    case tabBarColor
    case SecondaryDarkBlue_1B2026
    case blue_0024A5
    
    var name: String {self.rawValue}
}



enum AppImagesName: String {
    case menu_icon_1
    case menu_icon_2
    case menu_icon_5
    case menu_icon_4
    case menu_icon_3
    case menu_icon_6
    case menu_icon_7
    case menu_icon_8
    case menu_icon_9
    case menu_icon_10
    case menu_icon_11
    case menu_icon_12
    case menu_icon_13
    case menu_icon_14
    case menu_icon_15
    case menu_icon_40
    case defaultMenuIcon
    case backgroundImage
    case newDesignBackground
    case show_password_icon
    case hide_password_icon
    case navigationImage
    case homeBackgroundImage
    case dropdown
    case newDesignBackgroundImage
    case squadDownArrow
    case fixtures_shiny_line
    case pointsStar
    
    
    //   menu icon
    
    case standings
    case news
    case photos
    case videos
    case aboutUs
    case contactUs
    case termsAndCondition
    case privacyPolicy
    case cookiePolicy
    case lSGAcademy
    case team
    
    
    
    //    Forgot Password Icons
    case forgot_password
    case sent_email
    case new_password
    case set_password_success
    case verification_sent
    case verification_success
    case union
    case shareIcon
    case squadBackground
    case squadDetailsBackgroundImage
    case SquadDetailssBackgroundGradient
    case downArrow
    case upArrow
    
    case radio_tick
    case backImage
    case whiteBackImage
    case settingImage
    case IND
    case UserImage
    
    //account delete restore
    case deleteAcc
    case restoreAcc
    case deleteSuccessAcc
    case restoreSuccessAcc
    
    case profileIcon
    case blackShareIcon
    case whiteShareIcon
    
    //scoreStrip
    case upcoming
    case result
    case live
    
    //fixtures
    case fixtures_upcoming
    case fixtures_result
    case fixtures_live
    case fixtures_completed
    
    //homepage squad
    case SquadImage
    case SquadGradient1
    case lsgHome_playerSquadGradientSide
    case lsgHome_playerSquadGradientCenter
    case initial_lsg_squad_liting_page_bg
    
    case more_selection
    case flpBackgroundImg
    case darkThemeBG
    
    //Fan Poll
    case fanpollOptionSelection
    case fanpollOptionNonSelection
    
    //Notification
    case onButton
    case offButton
    
    //Tabbar
    case lsgWallet_menuBar
    
    var name: String {self.rawValue}
}

//enum AppTestAssetsName: String {
//    case test_showcase
//    case test_videos
//    case test_advertisement
//    var name: String {self.rawValue}
//}
//
enum AppBackgroundImageName: String {
    case backgroundImage
    case newDesignBackground
    case yellow_padded_button_bg
    var name: String {self.rawValue}
}
//
//enum AppGradientAssetName: String {
//    case nav_bg_gradient
//    case stories_bg_gradient
//    case gamehub_bg_gradient
//    case gamehub_display_bg_gradient
//    var name: String {self.rawValue}
//}

enum NavigationBarAssetImages: String {
   // case gt_nav_score
    case profile_icon
    case UserImage
   // case gt_nav_back
    var name: String { self.rawValue }
}

enum AccountStatus: String {
    case delete
    case restore
}

enum Stage: Int {
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    
    var isCancelRequired: Bool {
        switch self {
            case .one, .three: return true
            default: return false
        }
    }
    
    var isUpperStackRequired: Bool {
        switch self {
            case .three: return true
            default: return false
        }
    }
    
    var isLowerStackRequired: Bool {
        switch self {
            case .one, .three: return true
            default: return false
        }
    }
    
    var lowerStackLabelName: String? {
        switch self {
        case .one:
            return "Email*"
        case .three:
            return "Confirm Password*"
        default:
            return nil
        }
    }
    
    var lowerStackPlaceHolder: String? {
        switch self {
        case .one:
            return "Enter your Email address"
        case .three:
            return "Enter your Password"
        default:
            return nil
        }
    }
    
    var number: Int {
        return self.rawValue
    }
    
    var isLastStage: Bool {
        switch self {
            case .seven: return true
            default: return false
        }
    }
    
    var imageName: AppImagesName {
        switch self {
        case .one:
            return .forgot_password
        case .two:
            return .sent_email
        case .three:
            return .new_password
        case .four:
            return .set_password_success
        case .five:
            return .verification_sent
        case .six:
            return .verification_success
        case .seven:
            return .union
        }
    }
    
    var needsSecureInput: Bool {
        switch self {
        case .three: return true
        default: return false
        }
    }
    
    var headerText: String {
        switch self {
        case .one:
            return "Forgot your password?"
        case .two:
            return "Check your Email"
        case .three:
            return "Set your Password"
        case .four:
            return "Success"
        case .five:
            return "A verification link has been sent to your email"
        case .six:
            return "Registration Completed  Successfully"
        case .seven:
            return "Congratulations!"
        }
    }
    
    var descriptionText: String {
        switch self {
        case .one:
            return "Don’t worry, we are here to help you to recover your password. Enter your registered email below for further instructions."
        case .two:
            return "We have sent a password recovery instruction to your email"
        case .three:
            return "Enter your new password. Your password must contain at least: 1 uppercase letter, 1 lowercase letter, 1 number, and one special character (E.g. , . _ & ? etc)"
        case .four:
            return "Your password has been successfully reset."
        case .five:
            return "Please click on the link that has  been sent to your email address to verify and continue the registration process."
        case .six:
            return " "
        case .seven:
            return "Your account has been created successfully."
        }
    }
    
    mutating func incrementStage() {
        let stageNumber = self.number + 1
        self = Stage(rawValue: stageNumber) ?? .one
    }
    
}

// MARK: - HOME PAGE LAYOUT BUILDER REQUIREMENTS
enum LSGHomePageLayoutWidgetsEnum: String {
    case app_showcase = "App Showcase"
    case standings = "Standings"
    case topBanner = "Top Banner"
    case videos = "Latest Videos"
    case photos = "Latest Photos"
    case contestForm = "Contest Form"
    case squad = "Squad"
    case bottomBanner = "Bottom Banner"
    case latestUpdates = "Latest Updates"
    //case mastHead = "Masthead"
    case scorestrip = "Scorestrip"
    case shop = "Shop"
    case poll = "Poll"
    case fanzone = "Fan Zone"
    case shopBanner = "Shop Banner"
    case unknown
}

enum CustomCellWidgetsEnum {
    case largeListingCell
    case listingCell
    case dependencyWidget
    case bannerAd
    case mRectAd
    case unknown
}

enum AssetType: Int {
    case article = 1
    case photos = 2
    case videos = 4
    case unknown
}

enum VideoContentType: String {
    case youtube = "1"
    case navtive = "10"
    var value: String { self.rawValue }
}

enum SIParameterKeys: String {
    case image_path = "{image_path}"
    case image_name = "{image_name}"
    case image_width = "{image_width}"
    case content_image_version = "{content_image_version}"
    case email_id = "{email_id}"
    case default_team_id = "{default_team_id}"
    case default_series_id = "{default_series_id}"
    case player_id = "{player_id}"
    case staff_id = "{staff_id}"
    case data_image_version = "{data_image_version}"
    case page_count = "{count}"
    case page_number = "{page_no}"
    case title_alias = "{title_alias}"
    case entity_category = "{entity_category}"
    case country_id = "{country_id}"
    case nationality_id = "{nationality_id}"
    case user_id = "{user_id}"
    case deviceToken = "{device_token}"
    case notificationClientId = "{client_id}"
    case existingUseUrl = "email_id={email_id}"
    case imgRatio = "/0/"
    case teamID = "{team_id}"
    case seriesID = "{series_id}"
    case time_zone = "{time_zone}"
    case teamAName = "{teamA_name}"
    case teamBName = "{teamB_name}"
    case gameID = "{game_id}"
    case version = "{version}"
    case category = "{category}"
    case pollEntity = "{entity_role_map_id}"
    case feed_value = "{feed_value}"
    case feed_type = "{feed_type}"
    case season_display_name = "{season_display_name}"
    case user_guid = "{user_guid}"
    var name: String {self.rawValue}
}

enum NetworkErrors: String, Error {
//    case noInternet = "No Internet"
    case invalidUrl = "Invalid Url"
    case dataFailure = "Invalid Data"
    case invalidResponse = "Invalid Response"
    case unknownIssue = "Something went wrong!! Please try after some time"
    case userAccountExist = "User account already Exist."
    case none
}

enum NetworkTokenType: String {
    case authorization = "Authorization"
    case cleanAuthorization
    case authenticationWithUserToken
    case notificationAuth
    case cookieAuth
    case profileAuth
    case xAccess = "X-Access-Token"
    case loginAuth
}

enum LSGDateFormats: String {
    case siListing = "yyyy-MM-dd HH:mm:ss"
    // 2023-02-17T17:39:00
    case siListing2 = "yyyy-MM-dd'T'HH:mm:Z"
    case siListing3 = "d MMM, yyyy"
    case siListing4 = "yyyy-MM-dd'T'HH:mm:ss"
    case ddMMMyyyy = "dd MMM, yyyy"
    case ddMMMMyyyy = "dd MMMM yyyy"
    case fixtures = "yyyy-MM-dd'T'HH:mmZ"
    case monthDay = "MMM d"
    case dayMonth = "d MMM"
    case dayMonthYear = "d MMM yyyy"
    case time = "HH:mm a"
    case monthDayTime = "MMM d, hh:mm a"
    case dayMonthTime = "d MMM, h:mm a"
    case dateRange = "ddMMyyyy"
    case scorecardDateFormat = "M/d/yyyy"
    case scorecardTimeFormat = "HH:mm"
    case scorecardTimeWithOffset = "HH:mmZ"
    case monthFullYear = "MMM yyyy"
    case monthDateYear = "MMM d, yyyy"
    case fullMonthFullYear = "MMMM yyyy"
    case dobSignup = "dd/MM/yyyy"
    case yyyyddHHmmssSSS = "yyyy-MM-dd HH:mm:ss.SSS"
    case dobProfile = "yyyy-MM-dd"
    case fanLoyalty = "dd MMM yyyy | HH:mm"
    case flpTransaction = "MMM dd yyyy | HH:mm"
    case newFixtures = "dd MMMM, yyyy"
    case fixturesTime = "yyyy-MM-dd HH:mm Z"
    case squadOldFormat = "MMMM dd, yyyy"
    case dateNowFormat = "yyyy-MM-dd HH:mm:ss Z"
    case HHmmss = "HH:mm:ss"
}

enum AppUpdatePopupType: Int {
    case noUpdate = 0
    case optionalUpdate = 1
    case forceUpdate = 2
}

//enum MatchEventState: String, Codable {
//    case upcoming = "U"
//    case live = "L"
//    case result = "R"
//    case none
//    var stateValue: String { self.rawValue }
//
//    func getDescription() -> String {
//        guard let config = FirebaseModelConfig.sharedFirebaseConfig.appStaticText else {return .blank}
//        switch self {
//        case .upcoming:
//            return config.match_upcoming_text
//        case .live:
//            return config.match_live_text
//        case .result:
//            return config.match_result_text
//        case .none:
//            return .blank
//        }
//    }
//}

enum MatchEventState: String, Codable {
    case upcoming = "U"
    case live = "L"
    case result = "R"
    case none
//    var stateValue: String { self.rawValue }

//    func getDescription() -> String {
//        guard let config = FirebaseModelConfig.sharedFirebaseConfig.appStaticText else {return .blank}
//        switch self {
//        case .upcoming:
//            return config.match_upcoming_text
//        case .live:
//            return config.match_live_text
//        case .result:
//            return config.match_result_text
//        case .none:
//            return .blank
//        }
//    }
}


enum SquadPlayerSkillID: String, Codable {
    case all = "0"
    case batsman = "1"
    case bowler = "2"
    case allrounder = "3"
    case wicketKeeper = "4"
    var skillValue: String { self.rawValue }
}

enum BottomViewState {
    case expanded
    case collapsed
}

enum ListingType {
    case players
    case staff
}

enum PlayerDetailType {
    case bio
    case stats
}

enum StatsType {
    case IPL
    case T20I
}

enum SocialLoginType: Int {
    case google = 4
    case facebook = 2
    case apple = 9
    case whatsapp = 12
    var client_id: Int { return self.rawValue }
}

enum StandingType {
    case qualifying
    case all
}

enum FilterParameters: String {
    case entities
    case otherent
    case exclent
}

enum FilterType {
    case teams
    case standings
    case news
    case photos
    case videos
    case fixtures
}

enum JavascriptMethod: String {
    case nativeLogin
    case trackCustomEvent
}

enum UserType: String {
   case guest = "1"
   case registered = "2"
   case incomplete = "3"
}
