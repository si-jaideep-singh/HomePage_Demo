//
//  ArticleViewModel.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 12/08/24.
//


//import Combine
//import Foundation
//
//class ArticleViewModel: ObservableObject {
//    @Published var selectedIndex: Int?
//    @Published var currentContentType: LatestUpdatesContentType = .news
//    @Published var latestUpdateData: [String: SILayoutBuilderWidgetData] = [:]
//    @Published var categories: [LatestUpdatesContentType] = LatestUpdatesContentType.allCases
//
//    func selectCategory(_ category: LatestUpdatesContentType) {
//        self.currentContentType = category
//        // Handle data fetching or updates based on the selected category
//    }
//
//    func didSelectArticle(_ index: Int) {
//        // Handle article selection
//    }
//}


import SwiftUI

class NewsSmallViewModel: ObservableObject {
    @Published var smallArticle1: SILayoutBuilderModuleMetaInfo?
    @Published var smallArticle2: SILayoutBuilderWidgetDataItem?

    init(metaInfo: SILayoutBuilderModuleMetaInfo?, widgetData: SILayoutBuilderWidgetDataItem?) {
        self.smallArticle1 = metaInfo
        self.smallArticle2 = widgetData
    }
}
