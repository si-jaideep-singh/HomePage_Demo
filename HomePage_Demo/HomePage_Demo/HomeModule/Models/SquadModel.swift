//
//  SquadModel.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 08/08/24.
//

import Foundation

// MARK: - Welcome
struct SquadModel: Codable {
    var players: [PlayerData]?
    let supportStaff: [SupportStaffData]?

    enum CodingKeys: String, CodingKey {
        case players
        case supportStaff = "support_staff"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        players = try values.decodeIfPresent([PlayerData].self, forKey: .players)
        supportStaff = try values.decodeIfPresent([SupportStaffData].self, forKey: .supportStaff)
    }
}

// MARK: - PlayerData
struct PlayerData: Codable {
    var playerDetails: PlayerDetails?
    let overAllStats: OverAllStats?

    enum CodingKeys: String, CodingKey {
        case playerDetails = "player_details"
        case overAllStats = "over_all_stats"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        playerDetails = try values.decodeIfPresent(PlayerDetails.self, forKey: .playerDetails)
        overAllStats = try values.decodeIfPresent(OverAllStats.self, forKey: .overAllStats)
    }
}

// MARK: - OverAllStats
struct OverAllStats: Codable {
    let batting: Batting?
    let bowling: Bowling?
    let fielding: Fielding?
    
    enum CodingKeys: String, CodingKey {
        case batting = "batting"
        case bowling = "bowling"
        case fielding = "fielding"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        batting = try values.decodeIfPresent(Batting.self, forKey: .batting)
        bowling = try values.decodeIfPresent(Bowling.self, forKey: .bowling)
        fielding = try values.decodeIfPresent(Fielding.self, forKey: .fielding)
    }
}

// MARK: - Batting
struct Batting: Codable {
    let matchesPlayed, innings, notOuts, runs: Int?
    let balls, fours, sixes: Int?
    let strikeRate, average: Double?
    let fifties, hundred: Int?
    let boundaryFrequency, boundaryPercentage, dotBallFrequency, dotBallPercentage: Double?
    let highestScore: Int?
    let highestScoreNotout: String?

    enum CodingKeys: String, CodingKey {
        case matchesPlayed = "matches_played"
        case innings
        case notOuts = "not_outs"
        case runs, balls, fours, sixes
        case strikeRate = "strike_rate"
        case average, fifties, hundred
        case boundaryFrequency = "boundary_frequency"
        case boundaryPercentage = "boundary_percentage"
        case dotBallFrequency = "dot_ball_frequency"
        case dotBallPercentage = "dot_ball_percentage"
        case highestScore = "highest_score"
        case highestScoreNotout = "highest_score_notout"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        matchesPlayed = try values.decodeIfPresent(Int.self, forKey: .matchesPlayed)
        innings = try values.decodeIfPresent(Int.self, forKey: .innings)
        notOuts = try values.decodeIfPresent(Int.self, forKey: .notOuts)
        runs = try values.decodeIfPresent(Int.self, forKey: .runs)
        balls = try values.decodeIfPresent(Int.self, forKey: .balls)
        fours = try values.decodeIfPresent(Int.self, forKey: .fours)
        sixes = try values.decodeIfPresent(Int.self, forKey: .sixes)
        strikeRate = try values.decodeIfPresent(Double.self, forKey: .strikeRate)
        average = try values.decodeIfPresent(Double.self, forKey: .average)
        fifties = try values.decodeIfPresent(Int.self, forKey: .fifties)
        hundred = try values.decodeIfPresent(Int.self, forKey: .hundred)
        boundaryFrequency = try values.decodeIfPresent(Double.self, forKey: .boundaryFrequency)
        boundaryPercentage = try values.decodeIfPresent(Double.self, forKey: .boundaryPercentage)
        dotBallFrequency = try values.decodeIfPresent(Double.self, forKey: .dotBallFrequency)
        dotBallPercentage = try values.decodeIfPresent(Double.self, forKey: .dotBallPercentage)
        highestScore = try values.decodeIfPresent(Int.self, forKey: .highestScore)
        highestScoreNotout = try values.decodeIfPresent(String.self, forKey: .highestScoreNotout)
    }
}

// MARK: - Bowling
struct Bowling: Codable {
    let matchesPlayed, innings: Int?
    let overs: Double?
    let runsConceded, maidens, wickets: Int?
    let average, economy, strikeRate, boundaryFrequency: Double?
    let boundaryPercentage, dotBallFrequency, dotBallPercentage: Double?
    let fiveWicketsHaul, fourWicketsHaul: Int?
    let best: String?

    enum CodingKeys: String, CodingKey {
        case matchesPlayed = "matches_played"
        case innings, overs
        case runsConceded = "runs_conceded"
        case maidens, wickets, average, economy
        case strikeRate = "strike_rate"
        case boundaryFrequency = "boundary_frequency"
        case boundaryPercentage = "boundary_percentage"
        case dotBallFrequency = "dot_ball_frequency"
        case dotBallPercentage = "dot_ball_percentage"
        case fiveWicketsHaul = "five_wickets_haul"
        case fourWicketsHaul = "four_wickets_haul"
        case best
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        matchesPlayed = try values.decodeIfPresent(Int.self, forKey: .matchesPlayed)
        innings = try values.decodeIfPresent(Int.self, forKey: .innings)
        overs = try values.decodeIfPresent(Double.self, forKey: .overs)
        runsConceded = try values.decodeIfPresent(Int.self, forKey: .runsConceded)
        maidens = try values.decodeIfPresent(Int.self, forKey: .maidens)
        wickets = try values.decodeIfPresent(Int.self, forKey: .wickets)
        average = try values.decodeIfPresent(Double.self, forKey: .average)
        economy = try values.decodeIfPresent(Double.self, forKey: .economy)
        strikeRate = try values.decodeIfPresent(Double.self, forKey: .strikeRate)
        boundaryFrequency = try values.decodeIfPresent(Double.self, forKey: .boundaryFrequency)
        boundaryPercentage = try values.decodeIfPresent(Double.self, forKey: .boundaryPercentage)
        dotBallFrequency = try values.decodeIfPresent(Double.self, forKey: .dotBallFrequency)
        dotBallPercentage = try values.decodeIfPresent(Double.self, forKey: .dotBallPercentage)
        fiveWicketsHaul = try values.decodeIfPresent(Int.self, forKey: .fiveWicketsHaul)
        fourWicketsHaul = try values.decodeIfPresent(Int.self, forKey: .fourWicketsHaul)
        best = try values.decodeIfPresent(String.self, forKey: .best)
    }
}

// MARK: - Fielding
struct Fielding: Codable {
    let catches, runouts, stumpings: Int?
    
    enum CodingKeys: String, CodingKey {
        case catches, runouts, stumpings
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        catches = try values.decodeIfPresent(Int.self, forKey: .catches)
        runouts = try values.decodeIfPresent(Int.self, forKey: .runouts)
        stumpings = try values.decodeIfPresent(Int.self, forKey: .stumpings)
    }
}

// MARK: - PlayerDetails
struct PlayerDetails: Codable {
    var id, name, nameEnglish, skillID, bio: String?
    var skill, nationalityID, nationality: String?
    var nationalTeamID, nationalTeam: String?
    var isWicketKeeper, isCaptain, isViceCaptain: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameEnglish = "name_english"
        case skillID = "skill_id"
        case skill
        case nationalityID = "nationality_id"
        case nationality
        case nationalTeamID = "national_team_id"
        case nationalTeam = "national_team"
        case isWicketKeeper = "is_wicket_keeper"
        case isCaptain = "is_captain"
        case isViceCaptain = "is_vice_captain"
        case bio
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nameEnglish = try values.decodeIfPresent(String.self, forKey: .nameEnglish)
        skillID = try values.decodeIfPresent(String.self, forKey: .skillID)
        skill = try values.decodeIfPresent(String.self, forKey: .skill)
        nationalityID = try values.decodeIfPresent(String.self, forKey: .nationalityID)
        nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
        nationalTeamID = try values.decodeIfPresent(String.self, forKey: .nationalTeamID)
        nationalTeam = try values.decodeIfPresent(String.self, forKey: .nationalTeam)
        isWicketKeeper = try values.decodeIfPresent(Bool.self, forKey: .isWicketKeeper)
        isCaptain = try values.decodeIfPresent(Bool.self, forKey: .isCaptain)
        isViceCaptain = try values.decodeIfPresent(Bool.self, forKey: .isViceCaptain)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
    }
}

// MARK: - SupportStaffData
struct SupportStaffData: Codable {
    let roleID, roleName, id, name: String?
    let nationalityID, nationalityName: String?

    enum CodingKeys: String, CodingKey {
        case roleID = "role_id"
        case roleName = "role_name"
        case id, name
        case nationalityID = "nationality_id"
        case nationalityName = "nationality_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        roleID = try values.decodeIfPresent(String.self, forKey: .roleID)
        roleName = try values.decodeIfPresent(String.self, forKey: .roleName)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nationalityID = try values.decodeIfPresent(String.self, forKey: .nationalityID)
        nationalityName = try values.decodeIfPresent(String.self, forKey: .nationalityName)
    }
}

