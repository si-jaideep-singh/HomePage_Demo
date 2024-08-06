//
//  MatchScoreCard.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//


import Foundation

// MARK: - MatchScoreCard
struct ScoreStripModel: Codable {
    var matches: [Match]?
}

struct Match: Codable, Equatable {
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.eventState == rhs.eventState
    }
    
    let resultSubCode: String?
    let venueName: String?
    let eventDay, tourID: String?
    let resultCode: String?
    let championshipID, eventIsDaynight, eventSubStatus: String?
    let participants: [Participant]?
    let tourName: String?
    let leagueCode: String?
    let eventSession: String?
    let venueGmtOffset: String?
    let eventFormat: String?
    let eventPriority, leagueID, parentSeriesID, eventGroup: String?
    let eventCoverageLevel: String?
    let eventIslinkable, hasStandings, eventCoverageLevelID, seriesStartDate: String?
    let winningMargin, eventLivecoverage: String?
    let eventStage: String?
    let eventStatusID, seriesEndDate, gameID, startDate: String?
    let eventThisover: String?
    let eventStatus: String?
    let championshipName, seriesID: String?
    let sport: String?
    let seriesName: String?
    let eventState: MatchState?
    let eventName, eventDurationLeft, venueID: String?
    let parentSeriesName: String?
    let compTypeID, endDate: String?

    enum CodingKeys: String, CodingKey {
        case resultSubCode = "result_sub_code"
        case venueName = "venue_name"
        case eventDay = "event_day"
        case tourID = "tour_id"
        case resultCode = "result_code"
        case championshipID = "championship_id"
        case eventIsDaynight = "event_is_daynight"
        case eventSubStatus = "event_sub_status"
        case participants
        case tourName = "tour_name"
        case leagueCode = "league_code"
        case eventSession = "event_session"
        case venueGmtOffset = "venue_gmt_offset"
        case eventFormat = "event_format"
        case eventPriority = "event_priority"
        case leagueID = "league_id"
        case parentSeriesID = "parent_series_id"
        case eventGroup = "event_group"
        case eventCoverageLevel = "event_coverage_level"
        case eventIslinkable = "event_islinkable"
        case hasStandings = "has_standings"
        case eventCoverageLevelID = "event_coverage_level_id"
        case seriesStartDate = "series_start_date"
        case winningMargin = "winning_margin"
        case eventLivecoverage = "event_livecoverage"
        case eventStage = "event_stage"
        case eventStatusID = "event_status_id"
        case seriesEndDate = "series_end_date"
        case gameID = "game_id"
        case startDate = "start_date"
        case eventThisover = "event_thisover"
        case eventStatus = "event_status"
        case championshipName = "championship_name"
        case seriesID = "series_id"
        case sport
        case seriesName = "series_name"
        case eventState = "event_state"
        case eventName = "event_name"
        case eventDurationLeft = "event_duration_left"
        case venueID = "venue_id"
        case parentSeriesName = "parent_series_name"
        case compTypeID = "comp_type_id"
        case endDate = "end_date"
    }
}

enum MatchState : String, Codable {
    case live = "L"
    case recent = "R"
    case upcoming = "U"
    case other
    
    init(from decoder: Decoder) throws {
        let lable = try decoder.singleValueContainer().decode(String.self)
        self = MatchState(rawValue: lable) ?? .other
    }
}

// MARK: - Participant
struct Participant: Codable {
    let name: String?
    let shortName: String?
    let id: String?
    let value, highlight, firstup, now: String?
    let shortNameEng: String?
    let playersInvolved: [JSONAny]?
    let nameEng: String?

    enum CodingKeys: String, CodingKey {
        case name
        case shortName = "short_name"
        case id, value, highlight, firstup, now
        case shortNameEng = "short_name_eng"
        case playersInvolved = "players_involved"
        case nameEng = "name_eng"
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
