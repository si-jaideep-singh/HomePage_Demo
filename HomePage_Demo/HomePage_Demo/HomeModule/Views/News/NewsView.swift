//
//  NewsView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//
//
//import SwiftUI
//
//struct NewsView: View {
////    var latestUpdateData : [String : CustomHomeWidget] = [:]
//   
//   
//    
//    
//    
//    var body: some View {
//       NewsLargeView()
//        Divider()
//            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
//        ForEach(0..<4) {
//            _ in
//         NewsSmalllView()
//            Divider()
//                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
//        }
//      
//        
//    }
//}
//
////#Preview {
////    NewsView(metaInfo: meta, widgetData: <#SILayoutBuilderWidgetDataItem?#>)
////}

import SwiftUI
struct NewsView: View {
    @State var latestUpdateData: [String: CustomHomeWidget]
    var currentContentType:  LatestUpdatesContentType = .news
    var widgetData: SILayoutBuilderWidgetData?
    var metaInfo: SILayoutBuilderModuleMetaInfo?
    
    var body: some View {
        List {
            if currentContentType == .news {
                
                ForEach(0..<(widgetData?.items?.count ?? 0)){
                    index in

                    if index == 0 {
                        if let widgetData = latestUpdateData["News"]?.homeLayout?.widgetData?.items?[safe: index],
                           let metaInfo = latestUpdateData["News"]?.homeLayout?.metaInfo {
                           NewsLargeView(widgetData: widgetData,metaInfo: metaInfo)

                        }
                    } else {
                        if let widgetData = latestUpdateData["News"]?.homeLayout?.widgetData?.items?[safe: index],
                           let metaInfo = latestUpdateData["News"]?.homeLayout?.metaInfo {
                            NewsSmalllView(widgetData: widgetData,metaInfo: metaInfo)
         
                        }
                    }
                }
            }
        }
    }
}

//#Preview{
//    NewsView(latestUpdateData: )
//}
