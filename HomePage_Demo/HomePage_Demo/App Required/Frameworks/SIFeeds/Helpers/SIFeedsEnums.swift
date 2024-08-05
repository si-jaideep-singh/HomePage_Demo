//
//  SIFeedEnums.swift
//  SIListing
//
//  Created by Siddharth Daga on 4/22/19.
//  Copyright © 2019 Sportz Interactive. All rights reserved.
//

import UIKit

public enum SIFeedsComponentType: Int, Codable {
    case si_custom = 211
    case si_listing = 7
    case si_showcase = 9
    case si_ads = 1
    case unknown

    public init(from decoder: Decoder) throws {
        self = try SIFeedsComponentType(rawValue: decoder.singleValueContainer().decode(Int.self)) ?? .unknown
    }
}

public enum SIFeedsComponentName: String, Codable {
    case si_showcase = "si-showcase"
    case si_scorestrip = "si-scorestrip"
    case si_standings = "SI-standings"
    case si_listing = "si-listing"
    case si_squad = "si-squad"
    case si_fixed_dynamic_content_listing = "si-fixed-dynamic-content-listing"
    case si_ads = "si-ads"
    case si_poll = "si-poll"
    case si_fan_zone = "si-fan-zone"
    case si_shop_banner = "si-shop-banner"
    case unknown
}
//{
//    case si_showcase = "si-showcase"
//    case si_ads = "si-ads"
//    case si_scores_strip = "si-scorestrip"
//    case si_listing = "si-listing"
//    case si_form = "si-form"
//    case si_squad = "si-squad"
//    case unknown
//}

public enum SIFeedsAssetType: Int, Codable {
    case news = 1
    case photots = 2
    case videos = 4
    case podcasts = 29
    case unknown

    public init(from decoder: Decoder) throws {
        self = try SIFeedsAssetType(rawValue: decoder.singleValueContainer().decode(Int.self)) ?? .unknown
    }
}