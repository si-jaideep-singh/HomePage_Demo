//
//  FilterListingModel.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 05/08/24.
//


import Foundation

// MARK: - Filters
struct FiltersListingModel: Codable {
    var filters: [FilterDetail]?
}

// MARK: - Filter
struct FilterDetail: Codable {
    var categoryTitle: String?
    var subCatList: [FilterValue]?
    var isExpanded: Bool = false

    enum CodingKeys: String, CodingKey {
        case categoryTitle
        case subCatList
//        case isExpanded
    }
}

// MARK: - FilterValue
struct FilterValue: Codable {
    var order: Int?
    var entities, otherent, exclent: String?
    var subCategoryName: String?
    var isSelected: Bool?
    var feedType, feedValue: String?
    var teamID: String?

    enum CodingKeys: String, CodingKey {
        case order, entities, otherent, exclent
        case subCategoryName = "sub_category_name"
        case isSelected
        case feedType = "feed_type"
        case feedValue = "feed_value"
        case teamID = "team_id"
    }
}


struct Skill: Codable {
    let skill_id: String
    let skill_name: String
}
struct DefaultFilterModel: Codable {
    var feedType, feedValue, seasonDisplayName: String?
    var seriesID: Int?

    enum CodingKeys: String, CodingKey {
        case feedType = "feed_type"
        case feedValue = "feed_value"
        case seriesID = "series_id"
        case seasonDisplayName = "season_display_name"
    }
}

struct BuyTicketsModel: Codable {
    let isVisible, isWebview, inAppBrowser, isExternalWebview: Bool?
    let tickets: [Ticket]?

    enum CodingKeys: String, CodingKey {
        case isVisible = "is_visible"
        case isWebview = "is_webview"
        case inAppBrowser = "in_app_browser"
        case isExternalWebview = "is_external_webview"
        case tickets
    }
}

// MARK: - Ticket
struct Ticket: Codable {
    let gameID: String?
    let ticketURL: String?

    enum CodingKeys: String, CodingKey {
        case gameID = "game_id"
        case ticketURL = "ticket_url"
    }
}

