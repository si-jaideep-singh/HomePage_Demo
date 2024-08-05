//
//  SocialLinkModel.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 10/03/23.
//

import Foundation

// MARK: - Welcome
struct SocialLinkModel: Codable {
    let social: SocialLink?
}
// MARK: - Social
struct SocialLink: Codable {
    let twitter, facebook, instagram, linkedin: String?
    let youtube: String?
}

