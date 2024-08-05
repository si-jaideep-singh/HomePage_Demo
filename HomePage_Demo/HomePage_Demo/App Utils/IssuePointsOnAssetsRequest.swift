//
//  IssuePointsOnAssetsRequest.swift
//  Lucknow Super Giants
//
//  Created by Shounak Jindam on 12/03/24.
//

import Foundation

struct IssuePointsOnAssetsRequest: Codable {
    var data: IssuePointsOnAssetsRequestData?
}

// MARK: - VideoTokenRequestData
struct IssuePointsOnAssetsRequestData: Codable {
    var asset_type_id, asset_id, captcha: String?
    var percentage, timespent: Int?
}
