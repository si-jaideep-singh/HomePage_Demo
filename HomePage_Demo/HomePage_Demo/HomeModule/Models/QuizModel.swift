//
//  QuizModel.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 08/08/24.
//


import Foundation

// MARK: - Quiz
class Quiz: Codable {
    var status: Int?
    var content: QuizContent?

    enum CodingKeys: String, CodingKey {
        case status, content
    }
}

// MARK: - Content
class QuizContent: Codable {
    var quizContentData: [QuizContentDataDetail]?
    var quizContentAdditionalInfo: QuizContentAdditionalInfo?

    enum CodingKeys: String, CodingKey {
        case quizContentData = "data"
        case quizContentAdditionalInfo = "additional_info"
    }
}

// MARK: - QuizContentAdditionalInfo
class QuizContentAdditionalInfo: Codable {
    var remainingVoteCnt: String?

    enum CodingKeys: String, CodingKey {
        case remainingVoteCnt = "remaining_vote_cnt"
    }
}

// MARK: - QuizContentDataDetail
class QuizContentDataDetail: Codable {
    var alias, title: String?
    var pollID: Int?
    var endDate: String?
    var imageURL: String?
    var isActive: Int?
    var pollDesc, pollGUID: String?
    var pollType, createdBy, isDeleted, isTrashed: Int?
    var startDate: String?
    var updatedBy: Int?
    var pollOption: [QuizContentDataDetailPollOption]?
    var createdDate: String?
    var isPublished: Int?
    var updatedDate: String?
    var totalResponse: Int?
    var imageFileName: String?
    var noOfAnsAllowed, publishedVersionNumber: Int?
    
    var pollDescriptionObject: PollDescriptionObject? {
        return CommonUtilities.shared.getCodableObjectFromString(
            text: self.pollDesc ?? .blank,
            type: PollDescriptionObject.self)
    }
    
    var calculatedTotalResponse: Int? {
        (pollOption?.compactMap({$0.responseCount}) ?? []).reduce(0, +)
    }
    
    var isPollAnsweredByUser: Bool? {
        return pollOption?.contains(where: {$0.userVoted == 1})
        
    }
    
    enum CodingKeys: String, CodingKey {
        case alias, title
        case pollID = "poll_id"
        case endDate = "end_date"
        case imageURL = "image_url"
        case isActive = "is_active"
        case pollDesc = "poll_desc"
        case pollGUID = "poll_guid"
        case pollType = "poll_type"
        case createdBy = "created_by"
        case isDeleted = "is_deleted"
        case isTrashed = "is_trashed"
        case startDate = "start_date"
        case updatedBy = "updated_by"
        case pollOption = "poll_option"
        case createdDate = "created_date"
        case isPublished = "is_published"
        case updatedDate = "updated_date"
        case totalResponse = "total_response"
        case imageFileName = "image_file_name"
        case noOfAnsAllowed = "no_of_ans_allowed"
        case publishedVersionNumber = "published_version_number"
    }
}

// MARK: - PollOption
class QuizContentDataDetailPollOption: Codable {
    var isAns: Int?
    var option: String?
    var pollID, isActive, createdBy, isDeleted: Int?
    var updatedBy, userVoted: Int?
    var createdDate: String?
    var optionOrder: Int?
    var updatedDate: String?
    var pollOptionID, responseCount: Int?
    var userAnswerID: Int?
    var pollOptionGUID: String?
    var pollDetailOptionObject: PollDetailsOption? {
        return CommonUtilities.shared.getCodableObjectFromString(
            text: self.option ?? .blank,
            type: PollDetailsOption.self)
    }
    
    enum CodingKeys: String, CodingKey {
        case isAns = "is_ans"
        case option
        case pollID = "poll_id"
        case isActive = "is_active"
        case createdBy = "created_by"
        case isDeleted = "is_deleted"
        case updatedBy = "updated_by"
        case userVoted = "user_voted"
        case createdDate = "created_date"
        case optionOrder = "option_order"
        case updatedDate = "updated_date"
        case pollOptionID = "poll_option_id"
        case responseCount = "response_count"
        case userAnswerID = "user_answer_id"
        case pollOptionGUID = "poll_option_guid"
    }
}

// MARK: - PollDescriptionObject
struct PollDescriptionObject: Codable {
    let optionName: String?
    let start_date: String?
    let end_date: String?
    let is_active: Int?
    let question_text: String?
}

// MARK: - POLL DETAILS OPTIONS OBJECT
struct PollDetailsOption: Codable {
    let answer: String?
    let player: String?
}

import Foundation
