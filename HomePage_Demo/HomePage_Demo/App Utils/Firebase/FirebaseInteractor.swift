//
//  FirebaseInteractor.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 04/03/23.
//

import Foundation
import FirebaseRemoteConfig

struct FirebaseInteractor {
    
    var remoteConfig: RemoteConfig!
    
    init() {
        self.remoteConfig = RemoteConfig.remoteConfig()
    }
    
    func fetchFirebaseConfig(completion: @escaping(_ result: Bool) -> Void) {
        self.remoteConfig.configSettings = RemoteConfigSettings()
        let expirationDuration: Double = 15 * 60
        self.remoteConfig.fetch(
            withExpirationDuration: expirationDuration) { status, error in
                if status == .success || status == .throttled {
                    self.remoteConfig.activate { _, firebaseError in
                        debugPrint("Firebase Error: \(String(describing: firebaseError ?? nil))")
                        FirebaseModelConfig.initFirebase(remoteConfig: self.remoteConfig)
                        completion(true)
                    }
                } else {
                    debugPrint("Firebase Error: \(String(describing: error))")
                    completion(false)
                }
            }
    }
}


struct FirebaseModelConfig: Codable {
    
    static var sharedFirebaseConfig = FirebaseModelConfig()
    
    //Api auth key
    var apiAuthKey: String?
    var webAuthKey: String?
    //App Static text
    var appStaticText: FirebaseStaticTexts?
    //var app_menu: LSGMenuItem?
    var appMenu: [LSGMenuItem] = []
    var baseUrl: String?
    var updatePopupType: Int? = 0
    var appStoreLinkUrl: String?
    
    var baseApiVersionPath: String?
    var defaultCountryId : String?
    var customTranslations : String?
    var homePath: String?
    var jerseyImgUrl: String?
    
    var issuePointsUrl: String?
    
    var defaultSeriesId: String?
    var defaultTeamId: String?
    var squadFeedUrl: String?
    
    var countryListUrl: String?
    var standingUrl: String?
 //   var dataImageVersion : Double?

    var contentSharingUrl: String?
    
    //primaryEnt and SecondaryEnt Handler
    var displayPrimaryTitle: Bool?
    
    //flp points visibility
    var profileEarnPointsVisibility: Bool?
    
    // Static Images Path Urls
    var baseContentImagePathUrl: String?
   // var contentImageVersion: Double?
    var baseCountryCodeImagePath: String?
    var baseCountryImagePath: String?
    var basePlayerImagePath: String?
    var baseSupportStaffImagePath: String?
    var baseTeamImagePath: String?
    var dataImageVersion: Double?
    var baseFavouritePlayerImagePath: String?
    var baseNationalityImagePath: String?
    var playerProfileUrl: String?
    var matchCardDetailUrl: String?
    
    // Listing API URlS
    var newsListingUrl: String?
    var royalTelevisionListingUrl: String?
    var videosListingUrl: String?
    var photosListingUrl: String?
    
    // DETAILS API URLS
    var articleDetailsUrl: String?
    var photoDetailsUrl: String?
    var videoDetailsUrl: String?
    
    // FAN POLL API
    var submitPollUrl: String?
    var getPollListingApi: String?
    
//    filter listings
    var teamsFilterList: [FilterDetail]?
    var standingFilterList: [FilterDetail]?
    var newsFilterList: [FilterDetail]?
    var photoFilterList: [FilterDetail]?
    var videoFilterList: [FilterDetail]?
    var matchesScreenFilters: [FilterDetail]?
    var skillFilter: [Skill]?
    
    var defaultValues: DefaultFilterModel?
    var buyTickets: BuyTicketsModel?
    
    //ScoreStrip feed url
    var scorestripFeedUrl: String?
    var matchesScreenFeedUrl: String?
    var matchVideosPrimaryEntity : Int?
    var matchNewsPrimaryEntity : Int?
    var matchStateInfo :  [[String: String]]?
    var matchesLivePolling: String?
    var upcomingPollingTime: String?

    //Live feed
    var liveFeedBuster: Bool?
    var liveFeedInterval: Int?
    //profile
    var getUserProfileUrl: String?
    var updateUserProfileUrl: String?
    var matchContentFeed :  String?
    
    // Onboarding Api Url
    var checkUserUrl: String?
    var forgotPasswordUrl: String?
    var loginUrl: String?
    var logoutUrl: String?
    var registerUrl: String?
    var sendOtpUrl: String?
    var socialLoginUrl: String?
    var verifyOtpUrl: String?
    var deleteAccountUrl: String?
    var deleteAccountTotalDaysCount: String?
    var restoreAccountUrl: String?
    var forYouContentListing: String?
    var whatsappLoginUrl: String?
    
    //WEb urls
    var privacyPolicyWebUrl: String?
    var termsConditionWebUrl: String?
    var socialLinks: SocialLinkModel?
    
    var squadStaffOrder : String?
    var matchCenterConfig: [MatchCenterConfigModel]?
    
    //Show login screen when app launch
    var showLogin: Bool?
    
    //Notifications
    var notificationsList : NotificationSettingModel?
    var playerBioList: [PlayerBioList]?
    var notificationAuthKey  : String?
    var notificationClientID : String?
    var getNotificationSubscriptionUrl : String?
    var subscripedNotificationUrl : String?
    var notificationBaseUrl : String?
    
    //FLP
    var flpEarnPts : [FanEarnPtsList]?
    var faqList : [FAQList]?
    var voucherList : [VoucherList]?
    var stepsToRedeem : [StepsToRedeemModel]?
    var fanLeaderBoardUrl : String?
    var voucherUrl : String?
    var voucherHistoryUrl : String?
    var redeemVoucherUrl : String?
    var peppoledgerUrl : String?
    var keyVoucherBannerImageUrl : String?
    var keyFlpRegistrationImageUrl: String?
    var earnPoint : String?
    var balancePoint : String?
    var profileBalancePoint : String?
    var profileLabelText : String?
    var earnInfoTextIos : String?
    var voteOnPoll: String?
    var REFUND : String?
    var OUTCOME_MATCH_PREDICTION : String?
    var PREDICTOR_LEADER: String?
    var MATCH_PREDICTION : String?
    var VIEW_PHOTO_GALLERY : String?
    var NEWSLETTER_SUBSCRIPTION : String?
    var REFERRAL : String?
    var REDUCE : String?
    
    public static func initFirebase(remoteConfig: RemoteConfig) {
        
        //Api auth key
        FirebaseModelConfig.sharedFirebaseConfig.apiAuthKey = remoteConfig[FirebaseModelConfigKeys.apiAuthKey.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.webAuthKey = remoteConfig[FirebaseModelConfigKeys.webAuthKey.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.baseUrl = remoteConfig[FirebaseModelConfigKeys.baseUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.jerseyImgUrl = remoteConfig[FirebaseModelConfigKeys.jerseyImgUrl.name].stringValue ?? .blank
        
       
        
        FirebaseModelConfig.sharedFirebaseConfig.issuePointsUrl = remoteConfig[FirebaseModelConfigKeys.issuePointsUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.baseApiVersionPath = remoteConfig[FirebaseModelConfigKeys.baseApiVersionPath.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.updatePopupType = remoteConfig[FirebaseModelConfigKeys.updatePopupType.name].numberValue.intValue
        
        FirebaseModelConfig.sharedFirebaseConfig.appStoreLinkUrl = remoteConfig[FirebaseModelConfigKeys.appStoreLinkUrl.name].stringValue ?? .blank
        
        
        //App Static text
        let staticTextJson = remoteConfig[FirebaseModelConfigKeys.appStaticText.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.appStaticText = CommonUtilities.shared.getCodableObjectFromString(
            text: staticTextJson,
            type: FirebaseStaticTexts.self)
        
        
        let appMenu = remoteConfig[FirebaseModelConfigKeys.appMenu.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.appMenu = CommonUtilities.shared.getCodableObjectFromString(
                    text: appMenu,
                    type: [LSGMenuItem].self) ?? []
        
        FirebaseModelConfig.sharedFirebaseConfig.defaultCountryId = remoteConfig[FirebaseModelConfigKeys.defaultCountryId.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.squadFeedUrl = remoteConfig[FirebaseModelConfigKeys.squadFeedUrl.name].stringValue ?? .blank
   
        FirebaseModelConfig.sharedFirebaseConfig.customTranslations = remoteConfig[FirebaseModelConfigKeys.customTranslations.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.contentSharingUrl = remoteConfig[FirebaseModelConfigKeys.contentSharingUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.countryListUrl = remoteConfig[FirebaseModelConfigKeys.countryListUrl.rawValue].stringValue ?? .blank
        
        
        FirebaseModelConfig.sharedFirebaseConfig.homePath = remoteConfig[FirebaseModelConfigKeys.homePath.name].stringValue ?? .blank
        
        // Static Images Path Urls
        FirebaseModelConfig.sharedFirebaseConfig.baseContentImagePathUrl = remoteConfig[FirebaseModelConfigKeys.baseContentImagePathUrl.name].stringValue ?? .blank
       // FirebaseModelConfig.sharedFirebaseConfig.contentImageVersion = remoteConfig[FirebaseModelConfigKeys.contentImageVersion.name].numberValue.doubleValue
        FirebaseModelConfig.sharedFirebaseConfig.baseCountryCodeImagePath = remoteConfig[FirebaseModelConfigKeys.baseCountryCodeImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.baseCountryImagePath = remoteConfig[FirebaseModelConfigKeys.baseCountryImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.basePlayerImagePath = remoteConfig[FirebaseModelConfigKeys.basePlayerImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.baseSupportStaffImagePath = remoteConfig[FirebaseModelConfigKeys.baseSupportStaffImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.baseTeamImagePath = remoteConfig[FirebaseModelConfigKeys.baseTeamImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.dataImageVersion = remoteConfig[FirebaseModelConfigKeys.dataImageVersion.name].numberValue.doubleValue
        FirebaseModelConfig.sharedFirebaseConfig.baseFavouritePlayerImagePath = remoteConfig[FirebaseModelConfigKeys.baseFavouritePlayerImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.baseNationalityImagePath = remoteConfig[FirebaseModelConfigKeys.baseNationalityImagePath.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.playerProfileUrl = remoteConfig[FirebaseModelConfigKeys.playerProfileUrl.name].stringValue ?? .blank
        
        // LISTING API PATH URLS
        FirebaseModelConfig.sharedFirebaseConfig.newsListingUrl = remoteConfig[FirebaseModelConfigKeys.newsListingUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.photosListingUrl = remoteConfig[FirebaseModelConfigKeys.photosListingUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.videosListingUrl = remoteConfig[FirebaseModelConfigKeys.videosListingUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.matchCardDetailUrl = remoteConfig[FirebaseModelConfigKeys.matchCardDetailUrl.name].stringValue ?? .blank
        
        //Teams Filter Listing
        let teamFilterJSON = remoteConfig[FirebaseModelConfigKeys.teamsFilterList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.teamsFilterList = CommonUtilities.shared.getCodableObjectFromString(
            text: teamFilterJSON,
            type: [FilterDetail].self)
        
        //Standings Filter Listing
        let standingFilterJSON = remoteConfig[FirebaseModelConfigKeys.standingFilterList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.standingFilterList = CommonUtilities.shared.getCodableObjectFromString(
            text: standingFilterJSON,
            type: [FilterDetail].self)
        
        //News Filter Listing
        let newsFilterJSON = remoteConfig[FirebaseModelConfigKeys.newsFilterList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.newsFilterList = CommonUtilities.shared.getCodableObjectFromString(
            text: newsFilterJSON,
            type: [FilterDetail].self)
        
        //Photos Filter Listing
        let photoFilterJSON = remoteConfig[FirebaseModelConfigKeys.photoFilterList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.photoFilterList = CommonUtilities.shared.getCodableObjectFromString(
            text: photoFilterJSON,
            type: [FilterDetail].self)
        
        //Videos Filter Listing
        let videoFilterJSON = remoteConfig[FirebaseModelConfigKeys.videoFilterList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.videoFilterList = CommonUtilities.shared.getCodableObjectFromString(
            text: videoFilterJSON,
            type: [FilterDetail].self)
        
        //Fixtures Filter Listing
        let matchesFilterJSON = remoteConfig[FirebaseModelConfigKeys.matchesScreenFilters.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.matchesScreenFilters = CommonUtilities.shared.getCodableObjectFromString(
            text: matchesFilterJSON,
            type: [FilterDetail].self)
        
        //Skill Filter
        let skillFilterJSON = remoteConfig[FirebaseModelConfigKeys.skillFilter.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.skillFilter = CommonUtilities.shared.getCodableObjectFromString(text: skillFilterJSON, type: [Skill].self)
        
        FirebaseModelConfig.sharedFirebaseConfig.matchContentFeed = remoteConfig[FirebaseModelConfigKeys.matchContentFeed.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.matchVideosPrimaryEntity = remoteConfig[FirebaseModelConfigKeys.matchVideosPrimaryEntity.name].numberValue.intValue
        
        FirebaseModelConfig.sharedFirebaseConfig.matchNewsPrimaryEntity = remoteConfig[FirebaseModelConfigKeys.matchNewsPrimaryEntity.name].numberValue.intValue
        
        let defaultValuesModel = remoteConfig[FirebaseModelConfigKeys.defaultValues.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.defaultValues = CommonUtilities.shared.getCodableObjectFromString(
            text: defaultValuesModel,
            type: DefaultFilterModel.self)
        
        let buyTickets = remoteConfig[FirebaseModelConfigKeys.buyTickets.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.buyTickets = CommonUtilities.shared.getCodableObjectFromString(
            text: buyTickets,
            type: BuyTicketsModel.self)
        
        FirebaseModelConfig.sharedFirebaseConfig.defaultSeriesId = remoteConfig[FirebaseModelConfigKeys.defaultSeriesId.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.defaultTeamId = remoteConfig[FirebaseModelConfigKeys.defaultTeamId.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.standingUrl = remoteConfig[FirebaseModelConfigKeys.standingUrl.name].stringValue ?? .blank

        // DETAILS API PATH URLS
        FirebaseModelConfig.sharedFirebaseConfig.articleDetailsUrl = remoteConfig[FirebaseModelConfigKeys.articleDetailsUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.photoDetailsUrl = remoteConfig[FirebaseModelConfigKeys.photoDetailsUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.videoDetailsUrl = remoteConfig[FirebaseModelConfigKeys.videoDetailsUrl.name].stringValue ?? .blank
        
        // FAN POLL API
        FirebaseModelConfig.sharedFirebaseConfig.getPollListingApi = remoteConfig[FirebaseModelConfigKeys.getPollListingUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.submitPollUrl = remoteConfig[FirebaseModelConfigKeys.submitPollUrl.name].stringValue ?? .blank
        
        // ScoreStrip feed url
        FirebaseModelConfig.sharedFirebaseConfig.scorestripFeedUrl = remoteConfig[FirebaseModelConfigKeys.scorestripFeedUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.matchesScreenFeedUrl = remoteConfig[FirebaseModelConfigKeys.matchesScreenFeedUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.matchStateInfo = (remoteConfig[FirebaseModelConfigKeys.matchStateInfo.name].jsonValue) as? [[String : String]]
        
        FirebaseModelConfig.sharedFirebaseConfig.matchesLivePolling = remoteConfig[FirebaseModelConfigKeys.matchesLivePolling.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.upcomingPollingTime = remoteConfig[FirebaseModelConfigKeys.upcomingPollingTime.name].stringValue ?? .blank
        //Live feed
        FirebaseModelConfig.sharedFirebaseConfig.liveFeedBuster = remoteConfig[FirebaseModelConfigKeys.liveFeedBuster.name].boolValue
        FirebaseModelConfig.sharedFirebaseConfig.liveFeedInterval = remoteConfig[FirebaseModelConfigKeys.liveFeedInterval.name].numberValue.intValue
        //profile
        FirebaseModelConfig.sharedFirebaseConfig.getUserProfileUrl = remoteConfig[FirebaseModelConfigKeys.getUserProfileUrl.rawValue].stringValue ?? .blank
        
        
        FirebaseModelConfig.sharedFirebaseConfig.updateUserProfileUrl = remoteConfig[FirebaseModelConfigKeys.updateUserProfileUrl.rawValue].stringValue ?? .blank
        
        
        // OnBoarding Api Path Urls
        FirebaseModelConfig.sharedFirebaseConfig.checkUserUrl = remoteConfig[FirebaseModelConfigKeys.checkUserUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.forgotPasswordUrl = remoteConfig[FirebaseModelConfigKeys.forgotPasswordUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.loginUrl = remoteConfig[FirebaseModelConfigKeys.loginUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.logoutUrl = remoteConfig[FirebaseModelConfigKeys.logoutUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.registerUrl = remoteConfig[FirebaseModelConfigKeys.registerUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.sendOtpUrl = remoteConfig[FirebaseModelConfigKeys.sendOtpUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.socialLoginUrl = remoteConfig[FirebaseModelConfigKeys.socialLoginUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.verifyOtpUrl = remoteConfig[FirebaseModelConfigKeys.verifyOtpUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.deleteAccountUrl = remoteConfig[FirebaseModelConfigKeys.deleteAccountUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.deleteAccountTotalDaysCount = remoteConfig[FirebaseModelConfigKeys.deleteAccountTotalDaysCount.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.restoreAccountUrl = remoteConfig[FirebaseModelConfigKeys.restoreAccountUrl.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.forYouContentListing = remoteConfig[FirebaseModelConfigKeys.forYouContentListing.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.whatsappLoginUrl = remoteConfig[FirebaseModelConfigKeys.whatsappLoginUrl.name].stringValue ?? .blank
        
        //Show Login screen
        FirebaseModelConfig.sharedFirebaseConfig.showLogin = remoteConfig[FirebaseModelConfigKeys.showLogin.name].boolValue
        
        //primary and secondary Key
        FirebaseModelConfig.sharedFirebaseConfig.displayPrimaryTitle = remoteConfig[FirebaseModelConfigKeys.displayPrimaryTitle.name].boolValue
        
        FirebaseModelConfig.sharedFirebaseConfig.profileEarnPointsVisibility = remoteConfig[FirebaseModelConfigKeys.profileEarnPointsVisibility.name].boolValue
        
        //weburl
        FirebaseModelConfig.sharedFirebaseConfig.privacyPolicyWebUrl = remoteConfig[FirebaseModelConfigKeys.privacyPolicyWebUrl.rawValue].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.termsConditionWebUrl = remoteConfig[FirebaseModelConfigKeys.termsConditionWebUrl.rawValue].stringValue ?? .blank
        
        let socialLinks = remoteConfig[FirebaseModelConfigKeys.socialLinks.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.socialLinks = CommonUtilities.shared.getCodableObjectFromString(text: socialLinks, type: SocialLinkModel.self)
        

        FirebaseModelConfig.sharedFirebaseConfig.squadStaffOrder = remoteConfig[FirebaseModelConfigKeys.squadStaffOrder.rawValue].stringValue ?? .blank

        //Notifications.
        let notificationsList = remoteConfig[FirebaseModelConfigKeys.notificationsList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.notificationsList = CommonUtilities.shared.getCodableObjectFromString(text: notificationsList, type: NotificationSettingModel.self)
        
        let matchCenterConfig = remoteConfig[FirebaseModelConfigKeys.matchCenterConfig.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.matchCenterConfig = CommonUtilities.shared.getCodableObjectFromString(
            text: matchCenterConfig,
            type: [MatchCenterConfigModel].self)
        
        FirebaseModelConfig.sharedFirebaseConfig.notificationAuthKey = remoteConfig[FirebaseModelConfigKeys.notificationAuthKey.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.notificationClientID = remoteConfig[FirebaseModelConfigKeys.notificationClientID.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.getNotificationSubscriptionUrl = remoteConfig[FirebaseModelConfigKeys.getNotificationSubscriptionUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.subscripedNotificationUrl = remoteConfig[FirebaseModelConfigKeys.subscripedNotificationUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.notificationBaseUrl = remoteConfig[FirebaseModelConfigKeys.notificationBaseUrl.name].stringValue ?? .blank
        

        FirebaseModelConfig.sharedFirebaseConfig.squadStaffOrder = remoteConfig[FirebaseModelConfigKeys.squadStaffOrder.rawValue].stringValue ?? .blank

        let playerBioList = remoteConfig[FirebaseModelConfigKeys.playerBioList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.playerBioList = CommonUtilities.shared.getCodableObjectFromString(
            text: playerBioList,
            type: [PlayerBioList].self)
        
        //FLP
        let fanEarnPtsList = remoteConfig[FirebaseModelConfigKeys.flpEarnPts.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.flpEarnPts = CommonUtilities.shared.getCodableObjectFromString(
            text: fanEarnPtsList,
            type: [FanEarnPtsList].self)
        
        let faqListStr = remoteConfig[FirebaseModelConfigKeys.faqList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.faqList = CommonUtilities.shared.getCodableObjectFromString(
            text: faqListStr,
            type: [FAQList].self)
        
        let voucherListStr = remoteConfig[FirebaseModelConfigKeys.voucherList.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.voucherList = CommonUtilities.shared.getCodableObjectFromString(
            text: voucherListStr,
            type: [VoucherList].self)
        
        let stepsToRedeemStr = remoteConfig[FirebaseModelConfigKeys.stepsToRedeem.name].stringValue ?? .blank
        FirebaseModelConfig.sharedFirebaseConfig.stepsToRedeem = CommonUtilities.shared.getCodableObjectFromString(
            text: stepsToRedeemStr,
            type: [StepsToRedeemModel].self)
        
        FirebaseModelConfig.sharedFirebaseConfig.fanLeaderBoardUrl = remoteConfig[FirebaseModelConfigKeys.fanLeaderBoardUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.voucherUrl = remoteConfig[FirebaseModelConfigKeys.voucherUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.voucherHistoryUrl = remoteConfig[FirebaseModelConfigKeys.voucherHistoryUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.redeemVoucherUrl = remoteConfig[FirebaseModelConfigKeys.redeemVoucherUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.peppoledgerUrl = remoteConfig[FirebaseModelConfigKeys.peppoledgerUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.keyVoucherBannerImageUrl = remoteConfig[FirebaseModelConfigKeys.keyVoucherBannerImageUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.keyFlpRegistrationImageUrl = remoteConfig[FirebaseModelConfigKeys.keyFlpRegistrationImageUrl.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.earnPoint = remoteConfig[FirebaseModelConfigKeys.earnPoint.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.balancePoint = remoteConfig[FirebaseModelConfigKeys.balancePoint.name].stringValue ?? .blank
        
        
        FirebaseModelConfig.sharedFirebaseConfig.profileBalancePoint = remoteConfig[FirebaseModelConfigKeys.profileBalancePoint.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.profileLabelText = remoteConfig[FirebaseModelConfigKeys.profileLabelText.name].stringValue ?? .blank
        
        FirebaseModelConfig.sharedFirebaseConfig.earnInfoTextIos = remoteConfig[FirebaseModelConfigKeys.earnInfoTextIos.name].stringValue ?? .blank
       
        FirebaseModelConfig.sharedFirebaseConfig.voteOnPoll = remoteConfig[FirebaseModelConfigKeys.voteOnPoll.name].stringValue ?? .blank
        
        
    }
    
    
    public enum FirebaseModelConfigKeys: String {
        
        //Api auth key
        case apiAuthKey = "api_auth_key"
        case webAuthKey = "web_auth_key"
        
        case baseUrl = "base_url"
        case baseApiVersionPath = "api_version_path"
        case updatePopupType = "update_popup_type"
        case appStoreLinkUrl = "appstore_app_link_url"
        case homePath = "home_path"
        
        case appMenu = "app_menu"
        case appStaticText = "app_static_texts"
        
        case defaultCountryId = "auth_default_country_id"
        case customTranslations = "custom_translations"
        case contentSharingUrl = "content_sharing_url"
        case issuePointsUrl = "issue_points_on_assets_url"
        
        //primaryEnt and SecondaryEnt Handler
        case displayPrimaryTitle = "display_primary_title"
        
        //flp points visibility
        case profileEarnPointsVisibility = "profile_earn_points_visibility"
        
        // Static Images Path Keys
        case baseContentImagePathUrl = "base_content_image_path"
        case jerseyImgUrl = "key_jersey_image_url"
        //case contentImageVersion = "content_image_version"
        case baseCountryCodeImagePath = "country_code_flag"
        case baseCountryImagePath = "base_country_image_path"
        case basePlayerImagePath = "player_image_url"
        case baseSupportStaffImagePath = "base_support_staff_image_path"
        case baseTeamImagePath = "base_team_image_path"
        case dataImageVersion = "data_image_version"
        case countryListUrl = "country_list_Api"

        case defaultSeriesId = "default_series_id"
        case defaultTeamId = "default_team_id"
        case squadFeedUrl = "squad_feed_url"
        
        case standingUrl = "standing_url"
        case matchCardDetailUrl = "match_card_detail_url"
        
//        filter listings
        case teamsFilterList = "filter_team_list"
        case standingFilterList = "filter_standing_list"
        case newsFilterList = "news_filter_list"
        case photoFilterList = "photo_filter_list"
        case videoFilterList = "video_filter_list"
        case matchesScreenFilters = "matches_screen_filters"
        case skillFilter = "filter_skill"
        
        case defaultValues = "default_values"

        case baseFavouritePlayerImagePath = "base_favourite_player_image_path"
        case baseNationalityImagePath = "base_nationality_image_path"
        case playerProfileUrl = "player_profile_url"
        
        // Listing Api Path Keys
        case newsListingUrl = "news_listing_api"
       // case royalTelevisionListingUrl = "royalstv_listing_api"
        case videosListingUrl = "videos_listing_api"
        case photosListingUrl = "photos_listing_api"
        
        // DETAILS API PATH KEYS
        case articleDetailsUrl = "news_detail_url"
        case photoDetailsUrl = "photo_detail_url"
        case videoDetailsUrl = "video_detail_url"
        
        // QUIZ API
        case getPollListingUrl = "get_poll_listing_url"
        case submitPollUrl = "submit_poll_url"
        
        // ScoreStrip feed url
        case scorestripFeedUrl = "scorecard_matches_url"
        case matchesScreenFeedUrl = "matches_screen_feed_url"
        case matchStateInfo = "match_state_info_ios"
        case matchesLivePolling = "matches_live_polling"
        case upcomingPollingTime = "upcoming_polling_time"
        
        //Live feed
        case liveFeedBuster = "live_polling_buster"
        case liveFeedInterval = "live_polling_time_interval"
        case matchContentFeed = "match_content_feed"
        case matchVideosPrimaryEntity = "match_videos_primary_entity"
        case matchNewsPrimaryEntity = "match_news_primary_entity"
        case buyTickets = "buy_tickets"
        
        //profile
        case getUserProfileUrl = "get_user_profile_url"
       // case getProfileImageUrl = "get_profile_image_url"
        case updateUserProfileUrl = "update_user_profile_url"
        
        
        // OnBoarding Api Url path key.
        case checkUserUrl = "verify_email_url"
        case forgotPasswordUrl = "forgot_password_url"
        case loginUrl = "login_url"
        case logoutUrl = "log_out_url"
        case registerUrl = "signup_url"
        case sendOtpUrl = "send_otp_url"
        case socialLoginUrl = "social_login_url"
        case verifyOtpUrl = "verify_otp_url"
        case deleteAccountUrl = "delete_account_url"
        case deleteAccountTotalDaysCount = "delete_account_total_days_count"
        case restoreAccountUrl = "restore_account_url"
        case forYouContentListing = "for_you_content_listing"
        case whatsappLoginUrl = "whatsapp_login_url"
        
        //weburl
        case privacyPolicyWebUrl = "privacy_policy_web_url"
        case termsConditionWebUrl = "terms_condition_web_url"
        case socialLinks = "social_links"
        //Show Login screen when launch
        case showLogin = "show_login"


        //Notifications
        case notificationsList = "notification_settings_list"
        case matchCenterConfig = "matchcenter_config"
        case notificationAuthKey = "notification_api_auth_key"
        case notificationClientID = "notification_client_id"
        case getNotificationSubscriptionUrl = "get_notification_subscriptions_url"
        case subscripedNotificationUrl = "subscribe_user_notification_url"
        case notificationBaseUrl = "notification_base_url"

        case squadStaffOrder = "squad_staff_order"
        case playerBioList = "player_bio_list"
        
        //FLP
        case flpEarnPts = "fan_earn_point_list"
        case earnPoint = "earn_point"
        case balancePoint = "balance_point"
        case faqList = "points_faqs_list"
        case voucherList = "voucher_list"
        case stepsToRedeem = "earn_more_points_list"
        case fanLeaderBoardUrl = "peppo_leaderboard_url"
        case voucherUrl = "voucher_url"
        case voucherHistoryUrl = "voucher_history_url"
        case redeemVoucherUrl = "redeem_voucher_url"
        case peppoledgerUrl = "peppoledger_url"
        case keyVoucherBannerImageUrl = "key_voucher_banner_image_url"
        case keyFlpRegistrationImageUrl = "key_flp_registration_image_url"
        case profileBalancePoint = "profile_balance_point"
        case profileLabelText = "profile_label_text"
        case earnInfoTextIos = "earn_info_text_ios"
        case voteOnPoll = "VOTE_ON_POLLS"
        
        var name: String {self.rawValue}
    }
}
