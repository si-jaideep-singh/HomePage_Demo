//
//  Constants.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 05/02/23.
//

import Foundation

struct Constants {
    
    struct HomePageLayoutWidgetLayoutType {
        static let showcasewidget = "widget_layout_01"
        static let topBannerAdWidget = "widget_layout_01"
        static let bottomBannerAdWidget = "widget_layout_02"
        static let matchMastHeadWidget = "widget_layout_02"
        static let videosWidget = "widget_layout_02"
        static let latestUpdatesWidget = "widget_layout_01"
        static let latestPhotosWidget = "widget_layout_03"
        static let standingWidget = "widget_layout_04"
        static let adsWidget = "widget_layout_01"
        static let fanPoll = "widget_layout_01"
    }
    
    struct ApiConstants {
        static let url = "url"
        static let accessToken = "accessToken"
        static let IDToken = "IDToken"
        static let userid = "userID"
        static let responseToken = "usertoken"
        static let Auth = "auth"
        static let Cookie = "cookie"
        static let trueValue = "true"
        static let falseValue = "false"
//        static let AuthHeader = FirebaseModelConfig.sharedFirebaseConfig.apiAuthKey
//        static let WebAuthHeader = FirebaseModelConfig.sharedFirebaseConfig.webAuthKey
//        static let NotificationHeader = FirebaseModelConfig.sharedFirebaseConfig.notificationAuthKey
        static let videoToken = "videotoken"
        static let googlefirstname = "given_name"
        static let googlelastname = "family_name"
        static let fbfirstname = "first_name"
        static let fblastname = "last_name"
        static let feedBooster = "?v="
        static let appExtra = "app_extra"
        static let moeDeeplink = "moe_deeplink"
    }
    
    struct AnalyticsKeyParam {
        static let evetAction = "event_action"
        static let EventLabel = "event_label"
        static let Photo = "Photo"
        static let Video = "Video"
        static let VideoPlayback = "Video_Playback"
        static let bannerTop = "Top"
        static let bannerbottom = "Bottom"
        static let MastHead = "MastHead"
        static let userId = "user_id"
        static let userName = "user_name"
    }
    
    struct NotificationNameKey {
        static let pushNotification = "pushNotificationData"
    }

}

struct SquadConstant {
    static let close = "Close"
    static let knowMore = "Know More"
    static let role = "Role"
    static let catches = "Catches"
    static let stumpings = "Stumpings"
    static let wickets = "Wickets"
    static let economy = "Economy"
    static let bestFigures = "Best Figures"
    static let matchesPlayed = "Matches Played"
    static let runs = "Runs"
    static let highestScore = "Highest Score"
    static let strikeRate = "Strike Rate"
    static let defaultValue = "-"
}

struct ReCaptchaConstants {
    static let siteKey = "6LeFIeYjAAAAAFAoMZy_cefnnAvnGmqexXj6b8Wc"
    static let url = CommonUtilities().getApiBaseUrlCaptcha()
}

