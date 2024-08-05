//
//  LSGMenuType.swift
//  
//
//  Created by Jaideep Singh on 05/08/24.
//

import Foundation


class LSGMenuItem: Codable {
    let order: Int?
    let menuID: LSGMenuType?
    let displayTitle, menuIcon: String?
    let isVisible, isBottomBar, hasInteraction, isWebAuth, isLogin: Bool?
    let isWebview, inAppBrowser, isExternalWebview: Bool?
    let webviewURL: String?
    var isSelected: Bool?
    
    enum CodingKeys: String, CodingKey {
        case order
        case menuID = "menu_id"
        case displayTitle = "display_title"
        case menuIcon = "menu_icon"
        case isVisible = "is_visible"
        case isBottomBar = "is_bottom_bar"
        case hasInteraction = "has_interaction"
        case isWebAuth = "is_web_auth"
        case isWebview = "is_webview"
        case inAppBrowser = "in_app_browser"
        case isExternalWebview = "is_external_webview"
        case webviewURL = "webview_url"
        case isLogin = "is_login"
    }
}

enum LSGMenuType: Int, Codable {
    case home = 1
    case fixture = 2
    case video = 3
    case squad = 4
    case more = 5
    case news = 6
    case photo = 7
    case standing = 8
    case flp = 40

    case other
    
    init(from decoder: Decoder) throws {
        let lable = try decoder.singleValueContainer().decode(Int.self)
        self = LSGMenuType(rawValue: lable) ?? .other
    }
}

