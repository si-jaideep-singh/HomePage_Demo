//
//  StandingModel.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 08/08/24.
//


import Foundation

struct StandingsModel: Codable {
    let standings: Standings?
}

// MARK: - Standings
struct Standings: Codable {
    let stage1: Stage1?
}

// MARK: - Stage1
struct Stage1: Codable {
    let groups: [Group]?
    let stageID, stageType: String?
    let isActive: Is?

    enum CodingKeys: String, CodingKey {
        case groups
        case stageID = "stage_id"
        case stageType = "stage_type"
        case isActive = "is_active"
    }
}

// MARK: - Group
struct Group: Codable {
    let name: String?
    let team: [Team]?
}

// MARK: - Team
struct Team: Codable {
    let pos: String?
    let name: String?
    let shortName: String?
    let id, p, w, l: String?
    let t, nr, pts, nrr: String?
    let isQualified: String?
    let matches: [Matches]?

    enum CodingKeys: String, CodingKey {
        case pos, name
        case shortName = "short_name"
        case id, p, w, l, t, nr, pts, nrr
        case isQualified = "is_qualified"
        case matches
    }
}

enum Is: String, Codable {
    case isFalse = "False"
    case isTrue = "True"
}

// MARK: - Match
struct Matches: Codable {
    var id, filename, number, date: String?
    var outcome: String?
    var result, winnerID, teamaID, teamaScore: String?
    var teamaWickets, teamaOversPlayed, teambID, teambScore: String?
    var teambWickets, teambOversPlayed, vsID: String?
//    var vsFullname: NameEnum?
    var vsFullname: String?
//    var vsShortname: ShortNameEnum?
    var vsShortname: String?
    var venueID: String?
//    let venueFullname: VenueFullname?
    var venueFullname: String?
//    let venueShortname: VenueShortname?
    var venueShortname: String?
    var superOverWinnerID, superOverLoserID: String?

    enum CodingKeys: String, CodingKey {
        case id, filename, number, date, outcome, result
        case winnerID = "winner_id"
        case teamaID = "teama_id"
        case teamaScore = "teama_score"
        case teamaWickets = "teama_wickets"
        case teamaOversPlayed = "teama_overs_played"
        case teambID = "teamb_id"
        case teambScore = "teamb_score"
        case teambWickets = "teamb_wickets"
        case teambOversPlayed = "teamb_overs_played"
        case vsID = "vs_id"
        case vsFullname = "vs_fullname"
        case vsShortname = "vs_shortname"
        case venueID = "venue_id"
        case venueFullname = "venue_fullname"
        case venueShortname = "venue_shortname"
        case superOverWinnerID = "super_over_winner_id"
        case superOverLoserID = "super_over_loser_id"
    }
}

//enum VenueFullname: String, Codable {
//    case brabourneStadiumMumbai = "Brabourne Stadium, Mumbai"
//    case drDYPatilSportsAcademyNaviMumbai = "Dr. DY Patil Sports Academy, Navi Mumbai"
//    case maharashtraCricketAssociationStadiumPune = "Maharashtra Cricket Association Stadium, Pune"
//    case wankhedeStadiumMumbai = "Wankhede Stadium, Mumbai"
//    case narendraModiStadiumAhmedabad = "Narendra Modi Stadium, Ahmedabad"
//}
//
//enum VenueShortname: String, Codable {
//    case mumbai = "Mumbai"
//    case naviMumbai = "Navi Mumbai"
//    case pune = "Pune"
//    case ahmedabad = "Ahmedabad"
//}

enum NameEnum: String, Codable {
    case chennaiSuperKings = "Chennai Super Kings"
    case delhiCapitals = "Delhi Capitals"
    case gujaratTitans = "Gujarat Titans"
    case kolkataKnightRiders = "Kolkata Knight Riders"
    case lucknowSuperGiants = "Lucknow Super Giants"
    case mumbaiIndians = "Mumbai Indians"
    case punjabKings = "Punjab Kings"
    case rajasthanRoyals = "Rajasthan Royals"
    case royalChallengersBangalore = "Royal Challengers Bangalore"
    case sunrisersHyderabad = "Sunrisers Hyderabad"
}

enum ShortNameEnum: String, Codable {
    case csk = "CSK"
    case dc = "DC"
    case gt = "GT"
    case kkr = "KKR"
    case lsg = "LSG"
    case mi = "MI"
    case pbks = "PBKS"
    case rcb = "RCB"
    case rr = "RR"
    case srh = "SRH"
}


