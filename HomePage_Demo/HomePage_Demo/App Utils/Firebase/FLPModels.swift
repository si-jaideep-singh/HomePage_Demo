//
//  FLPEarnPointModel.swift
//  Lucknow Super Giants
//
//  Created by Kaustubh Gharat on 28/02/24.
//

import Foundation
// MARK: - FanEarnPtsListElement
struct FanEarnPtsList: Codable {
    var visible: Bool?
    var id: Int?
    var title, point, pointLabel: String?

    enum CodingKeys: String, CodingKey {
        case visible, id, title, point
        case pointLabel = "point_label"
    }
}

// MARK: - FAQList
struct FAQList: Codable {
    var id: Int?
    var displayTitle, description: String?
    var visible: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case displayTitle = "display_title"
        case description, visible
    }
}

// MARK: - VoucherList
struct VoucherList: Codable {
    var visible: String?
    var id: Int?
    var title, key: String?
    var banner_img : String?
}

// MARK: - StepsToRedeemModel
struct StepsToRedeemModel: Codable {
    var id, stepNo, stepDesc: String?
    var visible: Bool?
}
