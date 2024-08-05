//
//  PlayerBioList.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 20/04/23.
//

import Foundation

// MARK: - PlayerBioListElement
struct PlayerBioList: Codable {
    var playerID: Int?
    var playerName, bio: String?

    enum CodingKeys: String, CodingKey {
        case playerID = "player_id"
        case playerName = "player_name"
        case bio
    }
}

//typealias PlayerBioList = [PlayerBioLists]
