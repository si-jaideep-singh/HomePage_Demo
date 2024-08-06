//
//  CommonContentMatchModels.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//


import Foundation

// MARK: - CommonContentMatchesModel
struct CommonContentMatchesModel: Codable {
    let status: Int?
    let content: [String: CommonContent]?
    
    // Default value for CommonContentMatchesModel
        static let defaultModel = CommonContentMatchesModel(status: nil, content: nil)
    
    enum CodingKeys: String, CodingKey {
        case status
        case content

    }
}

// MARK: - Content
struct CommonContent: Codable {
    let items: [CommonContentItem]?
}

// MARK: - Item
struct CommonContentItem: Codable {
    let assetID: Int?
    let authorID: Int?
    let fullName, userName: String?
    let createdBy: Int?
    let imageData: ImageData?
    let imagePath, shortDesc: String?
    let updatedBy: Int?
    let assetTitle, priEntURL, secEntURL, titleAlias: String?
    let createdDate, displayName: String?
    let updatedDate: String?
    let assetListID, assetTypeID: Int?
    let publishedDate, imageFileName, priEntDispName, secEntDispName: String?
    let primaryEntityName, secondaryEntityName: String?
    let publishedVersionNumber, primaryEntityRoleMapID, secondaryEntityRoleMapID: Int?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case authorID = "author_id"
        case fullName = "full_name"
        case userName = "user_name"
        case createdBy = "created_by"
        case imageData = "image_data"
        case imagePath = "image_path"
        case shortDesc = "short_desc"
        case updatedBy = "updated_by"
        case assetTitle = "asset_title"
        case priEntURL = "pri_ent_url"
        case secEntURL = "sec_ent_url"
        case titleAlias = "title_alias"
        case createdDate = "created_date"
        case displayName = "display_name"
        case updatedDate = "updated_date"
        case assetListID = "asset_list_id"
        case assetTypeID = "asset_type_id"
        case publishedDate = "published_date"
        case imageFileName = "image_file_name"
        case priEntDispName = "pri_ent_disp_name"
        case secEntDispName = "sec_ent_disp_name"
        case primaryEntityName = "primary_entity_name"
        case secondaryEntityName = "secondary_entity_name"
        case publishedVersionNumber = "published_version_number"
        case primaryEntityRoleMapID = "primary_entity_role_map_id"
        case secondaryEntityRoleMapID = "secondary_entity_role_map_id"
    }
}

// MARK: - ImageData
struct ImageData: Codable {
    let imageID, isCover: Int?
    let imageAlt, imageSrc, imagepath, imgTitle: String?
    let imageDesc, imageCaption, imageFileName: String?

    enum CodingKeys: String, CodingKey {
        case imageID = "image_id"
        case isCover = "is_cover"
        case imageAlt = "image_alt"
        case imageSrc = "image_src"
        case imagepath
        case imgTitle = "img_title"
        case imageDesc = "image_desc"
        case imageCaption = "image_caption"
        case imageFileName = "image_file_name"
    }
}

