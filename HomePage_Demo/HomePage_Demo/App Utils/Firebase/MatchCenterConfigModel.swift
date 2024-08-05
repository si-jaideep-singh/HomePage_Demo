//
//  MatchCenterConfigModel.swift
//  Lucknow Super Giants
//
//  Created by Kaustubh Gharat on 24/03/23.
//

import Foundation


// MARK: - MatchCenterConfigModel
struct MatchCenterConfigModel: Codable {
    let matchID, title, webviewURL: String?

    enum CodingKeys: String, CodingKey {
        case matchID = "matchId"
        case title
        case webviewURL = "webviewUrl"
    }
}
