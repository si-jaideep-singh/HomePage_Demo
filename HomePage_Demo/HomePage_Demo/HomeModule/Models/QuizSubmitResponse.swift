//
//  QuizSubmitResponse.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 08/08/24.
//

import UIKit

// MARK: - QuizSubmitResponse
struct QuizSubmitResponse: Codable {
    let status: Int?
    let applicationDomain, data: String?
    let content: QuizSubmitResponseContent?
    let imagesData, authodata, nextPrev, entityData: String?
    let relatedArticle, message, responseStatus: String?
    let fetchfromcache, asycncall: Bool?
    let time, meta: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case applicationDomain = "ApplicationDomain"
        case data, content
        case imagesData = "ImagesData"
        case authodata = "Authodata"
        case nextPrev = "NextPrev"
        case entityData = "EntityData"
        case relatedArticle = "RelatedArticle"
        case message
        case responseStatus = "response_status"
        case fetchfromcache, asycncall, time, meta
    }
}

// MARK: - Content
struct QuizSubmitResponseContent: Codable {
    let data: QuizSubmitResponseDataClass?
}

// MARK: - DataClass
struct QuizSubmitResponseDataClass: Codable {
    let pollID: Int?
    let pollOption: [PollOption]?
    let totalResponses: Int?

    enum CodingKeys: String, CodingKey {
        case pollID = "poll_id"
        case pollOption = "poll_option"
        case totalResponses = "total_responses"
    }
}

// MARK: - PollOption
struct PollOption: Codable {
    let optionID, responseCount: Int?
    let userVoted: Int?

    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case responseCount = "response_count"
        case userVoted = "user_voted"
    }
}

