//
//  QuizSubmitRequest.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 08/08/24.
//

import Foundation
import UIKit

struct QuizSubmitRequestParams: Codable {
    let data: PollRequestData?
}

struct PollRequestData: Codable {
    var captcha: String = .blank
    var poll_id: String = .blank
    var polloption: [PollOptionRequest]?
    var guid: String = .blank
}

struct PollOptionRequest: Codable {
    var option_id: Int = 0
}
