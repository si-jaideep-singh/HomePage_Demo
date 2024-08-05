//
//  NotificationSettingModel.swift
//  Lucknow Super Giants
//
//  Created by Kaustubh Gharat on 20/03/23.
//

import Foundation

// MARK: - Welcome
struct NotificationSettingModel: Codable {
    var notificationSettings: [NotificationSetting]?

    enum CodingKeys: String, CodingKey {
        case notificationSettings = "notification_settings"
    }
}

// MARK: - NotificationSetting
struct NotificationSetting: Codable {
    var eventID, eventName: String?
    var isVisible, isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case eventName
        case isVisible = "is_visible"
        case isActive = "is_active"
    }
}
