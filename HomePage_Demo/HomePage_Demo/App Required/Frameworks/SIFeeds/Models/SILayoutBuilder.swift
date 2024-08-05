//
//  SILayoutBuilder.swift
//  SIListing
//
//  Created by Siddharth Daga on 4/10/19.
//  Copyright © 2019 Sportz Interactive. All rights reserved.
//

import Foundation

public struct SILayoutBuilderModel: Codable {
    var status: Int?
    var content: SILayoutBuilderContent?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case status
        case content
        case message
    }
}

public struct SILayoutBuilderContent: Codable {
    var html, title: String?
    var module: [SILayoutBuilderWidget]?
    var pageID: Int?
    var titleApp, titleWeb, titleMobile, masterhtml: String?
    var languageID: Int?
    var isredirect, redirecturl, redirectparent: String?
    var templateID: Int?
    var masterTemplateID: Int?
    var ShowInApp: Int?
    var isProtected: Bool?
    var parentID: Int?
    var pageEntity: [Int]?
    var languageName: String?
    var showData, showContent: Bool?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case html, title, module
        case pageID = "page_id"
        case titleApp = "title_app"
        case titleWeb = "title_web"
        case titleMobile = "title_mobile"
        case ShowInApp = "show_in_app"
        case masterhtml
        case languageID = "language_id"
        case isredirect, redirecturl, redirectparent
        case templateID = "template_id"
        case masterTemplateID = "master_template_id"
        case isProtected = "is_protected"
        case parentID = "parent_id"
        case pageEntity = "page_entity"
        case languageName = "language_name"
        case showData = "show_data"
        case showContent = "show_content"
        case statusCode = "status_code"
    }

}

public struct SILayoutBuilderWidget: Codable {
    var title, selector: String
    var metaInfo: SILayoutBuilderModuleMetaInfo?
    var dependency: [SILayoutBuilderDependency]?
    var fetchFrom, templateID: Int?
    var widgetData: SILayoutBuilderWidgetData?
    var componentID: Int?
    var displayTitle: String?
    var otherEntities: [Int]?
    var requiredEntities: [Int]?
    var templateComponentMapID, showInApp, showInWeb, showInMobile: Int?

    enum CodingKeys: String, CodingKey {
        case title, selector
        case metaInfo = "meta_info"
        case dependency
        case fetchFrom = "fetch_from"
        case templateID = "template_id"
        case widgetData = "widget_data"
        case componentID = "component_id"
        case displayTitle = "display_title"
        case otherEntities = "other_entities"
        case requiredEntities = "required_entities"
        case templateComponentMapID = "template_component_map_id"
        case showInApp = "show_in_app"
        case showInWeb = "show_in_web"
        case showInMobile = "show_in_mobile"
    }

}

// MARK: - ModuleMetaInfo
struct SILayoutBuilderModuleMetaInfo: Codable {
    var view: String?
    var order: Int?
    var isSelected : Bool = false
    var lgCol, lgRow, mdCol, mdRow: String?
    var smCol, smRow, xlCol, xlRow: String?
    var xsCol, xsRow, extraData: String?
    var component: SIFeedsComponentName?
    var seriesID, showDate, showTitle, showAuthor: Int?
    var loadmoreType: String?
    let tabTitle: String?
    let tabOrder: Int?
    let widgetOrder: Int?
    var showCategory, showItemIcon, showDescription: Int?
    var widgetTitleTag, articleTitleTag: String?
    public var showWidgetTitle, showitemIconContent: Int?
    var articleDescriptionTag, widgetTitleTagAttributes, articleTitleTagAttributes, articleDescriptionTagAttributes: String?
    var fb: Int?
    var imgRatio: String?
    var isShare, showImage, isComments, isReactions, tabView: Bool?
    var showTagline, showTimestamp, showImageCount: Bool?
    var bannerLink: String?
    var bannerWidth, bannerHeight: Int?
    var bannerImgage: String?
    var formFields: [SILayoutBuilderModuleMetaInfoFormFieldDetail]?
    var formTitle: String?
    var luckyDrawCode: String?
    let bannerData: [BannerDatum]?
    var isLogin, isFLP: Bool?
    var entityRoleMapId: Int?

    enum CodingKeys: String, CodingKey {
        case view, order
        case lgCol = "lg_col"
        case lgRow = "lg_row"
        case mdCol = "md_col"
        case mdRow = "md_row"
        case smCol = "sm_col"
        case smRow = "sm_row"
        case xlCol = "xl_col"
        case xlRow = "xl_row"
        case xsCol = "xs_col"
        case xsRow = "xs_row"
        case tabView = "tab_view"
        case tabOrder = "tab_order"
        case tabTitle = "tab_title"
        case showTitle = "show_title"
        case component, extraData
        case seriesID = "series_id"
        case showDate = "show_date"
        case showAuthor = "show_author"
        case loadmoreType = "loadmore_type"
        case showCategory = "show_category"
        case showItemIcon = "show_item_icon"
        case showDescription = "show_description"
        case widgetTitleTag = "widget_title_tag"
        case articleTitleTag = "article_title_tag"
        case widgetOrder = "widget_order"
        case showWidgetTitle = "show_widget_title"
        case showitemIconContent = "showitem_icon_content"
        case articleDescriptionTag = "article_description_tag"
        case widgetTitleTagAttributes = "widget_title_tag_attributes"
        case articleTitleTagAttributes = "article_title_tag_attributes"
        case articleDescriptionTagAttributes = "article_description_tag_attributes"
        case fb, imgRatio
        case isShare = "is_share"
        case showImage = "show_image"
        case isComments = "is_comments"
        case isReactions = "is_reactions"
        case showTagline = "show_tagline"
        case showTimestamp = "show_timestamp"
        case showImageCount = "show_image_count"
        case bannerData = "banner_data"
        case bannerLink = "banner_link"
        case bannerWidth = "banner_width"
        case bannerHeight = "banner_height"
        case bannerImgage = "banner_imgage"
        case formFields = "form_fields"
        case formTitle = "form_title"
        case luckyDrawCode = "lucky_draw_code"
        case isLogin = "is_login"
        case isFLP = "is_FLP"
        case entityRoleMapId = "entity_role_map_id"
    }
}


struct SILayoutBuilderModuleMetaInfoFormFieldDetail: Codable {
    var type: String?
    var order: Int?
    var title: String?
    var fieldName: String?
    var isRequired: Bool?

    enum CodingKeys: String, CodingKey {
        case type, order, title
        case fieldName = "field_name"
        case isRequired = "is_required"
    }
}

struct SILayoutBuilderDependency: Codable {
    var lgCol, lgRow, mdCol, mdRow: String?
    var smCol, smRow, xlCol, xlRow: String?
    var xsCol, xsRow, extraData: String?
    var showDate, showTitle, showAuthor: Int?
    var loadmoreType: String?
    var showCategory, showItemIcon, showDescription: Int?
    var widgetTitleTag: String?
    var showitemIconContent: Int?
    var widgetTitleTagAttributes: String?

    enum CodingKeys: String, CodingKey {
        case lgCol = "lg_col"
        case lgRow = "lg_row"
        case mdCol = "md_col"
        case mdRow = "md_row"
        case smCol = "sm_col"
        case smRow = "sm_row"
        case xlCol = "xl_col"
        case xlRow = "xl_row"
        case xsCol = "xs_col"
        case xsRow = "xs_row"
        case extraData
        case showDate = "show_date"
        case showTitle = "show_title"
        case showAuthor = "show_author"
        case loadmoreType = "loadmore_type"
        case showCategory = "show_category"
        case showItemIcon = "show_item_icon"
        case showDescription = "show_description"
        case widgetTitleTag = "widget_title_tag"
        case showitemIconContent = "showitem_icon_content"
        case widgetTitleTagAttributes = "widget_title_tag_attributes"
    }
}

// MARK: - SILayoutBuilderWidgetData
struct SILayoutBuilderWidgetData: Codable {
    var data: SILayoutBuilderDataClass?
    let items: [SILayoutBuilderWidgetDataItem]?
}

// MARK: - DataClass
struct SILayoutBuilderDataClass: Codable {
    let guid, count: String?
    let status: Int?
    let assetMap: [SILayoutBuilderDataAssetMap]?
    let isTrashed, updatedBy: Int?
    let publishedDate: String?
    let templateComponentMapID: Int?

    enum CodingKeys: String, CodingKey {
        case guid, count, status
        case assetMap = "asset_map"
        case isTrashed = "is_trashed"
        case updatedBy = "updated_by"
        case publishedDate = "published_date"
        case templateComponentMapID = "template_component_map_id"
    }
}

// MARK: - SILayoutBuilderDataAssetMap
struct SILayoutBuilderDataAssetMap: Codable {
    let author: [SILayoutBuilderAuthor]?
    let assetID: Int?
    let assetMeta: SILayoutBuilderAssetMeta?
    let assetType: Int?
    let entitydata: [SILayoutBuilderAssetMapEntity]?
    let assetOrder: Int?
    let publishDate: String?
    let publishedVersionNumber: Int?

    enum CodingKeys: String, CodingKey {
        case author
        case assetID = "asset_id"
        case assetMeta = "asset_meta"
        case assetType = "asset_type"
        case entitydata
        case assetOrder = "asset_order"
        case publishDate = "publish_date"
        case publishedVersionNumber = "published_version_number"
    }
}

// MARK: - SILayoutBuilderAuthor
struct SILayoutBuilderAuthor: Codable {
    var assetID, authorID: Int?
    var fullName: String?
    var userName: String?
    var authorName: String?
    var assetTypeID: Int?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case authorID = "author_id"
        case fullName = "full_name"
        case userName = "user_name"
        case authorName = "author_name"
        case assetTypeID = "asset_type_id"
    }
}

// MARK: - SILayoutBuilderAssetMeta
struct SILayoutBuilderAssetMeta: Codable {
    var url: String?
    var desc, title: String?
    var assetID: Int?
    var imageID: Int?
    var imageName, imagePath: String?
    var responsive: Int?
    var titleAlias: String?
    var videoEmbed: String?
    var contentType: Int?
    var mobImageID, scoreWicket, mobImageName, mobImagePath: String?
    var contentSourceID: Int?

    enum CodingKeys: String, CodingKey {
        case url, desc, title
        case assetID = "asset_id"
        case imageID = "image_id"
        case imageName = "image_name"
        case imagePath = "image_path"
        case responsive
        case titleAlias = "title_alias"
        case videoEmbed = "video_embed"
        case contentType = "content_type"
        case mobImageID = "mob_image_id"
        case scoreWicket = "score_wicket"
        case mobImageName = "mob_image_name"
        case mobImagePath = "mob_image_path"
        case contentSourceID = "content_source_id"
    }
}

// MARK: - SILayoutBuilderAssetMapEntity
struct SILayoutBuilderAssetMapEntity: Codable {
    var name: String?
    var isLang, assetID, priority: Int?
    var canonical: String?
    var entityURL: String?
    var isVisible, isLinkable, assetTypeID: Int?
    var entDispName: String?
    var entityRoleMapID: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case isLang = "is_lang"
        case assetID = "asset_id"
        case priority, canonical
        case entityURL = "entity_url"
        case isVisible = "is_visible"
        case isLinkable = "is_linkable"
        case assetTypeID = "asset_type_id"
        case entDispName = "ent_disp_name"
        case entityRoleMapID = "entity_role_map_id"
    }
}

// MARK: - SILayoutBuilderWidgetDataItem
struct SILayoutBuilderWidgetDataItem: Codable {
    var rno: Int?
    var tags: String?
    var assetID: Int?
    var duration: String?
    var authorID: Int?
    var fullName: String?
    var isActive: Int?
    var userName: String?
    var assetGUID: String?
    var createdBy: Int?
    var imagePath: String?
    var isDeleted, isTrashed: Int?
    var shortDesc: String?
    var updatedBy: Int?
    var assetTitle: String?
    var shortTitle: String?
    var showInApp: Int?
    var showInWeb: Int?
    var readTime: String?
    var titleAlias, createdDate: String?
    var displayName: String?
    var isPublished: Int?
    var orderNumber, totalAssets: Int?
    var updatedDate: String?
    var assetListID, assetTypeID: Int?
    var publishedDate: String?
    var showCopyright: Int?
    var showInMobile: Int?
    var imageFileName: String?
    var priEntDispName: String?
    var secEntDispName: String?
    var primaryEntityName: String?
    var secondaryEntityName: String?
    var secondaryEntityUrl: String?
    let bannerData: [BannerDatum]?
    var publishedVersionNumber, primaryEntityRoleMapID, secondaryEntityRoleMapID: Int?

    enum CodingKeys: String, CodingKey {
        case rno, tags
        case assetID = "asset_id"
        case duration
        case authorID = "author_id"
        case fullName = "full_name"
        case isActive = "is_active"
        case userName = "user_name"
        case assetGUID = "asset_guid"
        case createdBy = "created_by"
        case imagePath = "image_path"
        case isDeleted = "is_deleted"
        case isTrashed = "is_trashed"
        case shortDesc = "short_desc"
        case updatedBy = "updated_by"
        case assetTitle = "asset_title"
        case shortTitle = "short_title"
        case showInApp = "show_in_app"
        case showInWeb = "show_in_web"
        case titleAlias = "title_alias"
        case createdDate = "created_date"
        case displayName = "display_name"
        case isPublished = "is_published"
        case orderNumber = "order_number"
        case totalAssets = "total_assets"
        case updatedDate = "updated_date"
        case readTime = "read_time"
        case assetListID = "asset_list_id"
        case assetTypeID = "asset_type_id"
        case publishedDate = "published_date"
        case showCopyright = "show_copyright"
        case bannerData = "banner_data"
        case showInMobile = "show_in_mobile"
        case imageFileName = "image_file_name"
        case priEntDispName = "pri_ent_disp_name"
        case secEntDispName = "sec_ent_disp_name"
        case primaryEntityName = "primary_entity_name"
        case secondaryEntityName = "secondary_entity_name"
        case secondaryEntityUrl = "sec_ent_url"
        case publishedVersionNumber = "published_version_number"
        case primaryEntityRoleMapID = "primary_entity_role_map_id"
        case secondaryEntityRoleMapID = "secondary_entity_role_map_id"
    }
}

// MARK: - SIFeedsAdUnit
public struct SIFeedsAdUnit: Codable {
    public let ios, android: String?
}

//MARK: - BannerData

struct BannerDatum: Codable {
    let isLogin: Bool?
    let hasInteraction: Bool?
    let isWebview: Bool
    let webviewURL: String
    let bannerImage: String
    let bannerOrder: Int
    let displayTitle: String
    let inAppBrowser: Bool
    let analyticsTitle: String
    let isExternalWebview: Bool

    enum CodingKeys: String, CodingKey {
        case isWebview = "is_webview"
        case webviewURL = "webview_url"
        case bannerImage = "banner_image"
        case bannerOrder = "banner_order"
        case displayTitle = "display_title"
        case inAppBrowser = "in_app_browser"
        case analyticsTitle = "analytics_title"
        case hasInteraction = "has_interaction"
        case isExternalWebview = "is_external_webview"
        case isLogin = "is_login"
    }
}


