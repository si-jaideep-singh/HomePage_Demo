//
//  ContentHeader.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.

import SwiftUI

struct ContentHeader: View {
    @State private var selectedTab: LatestUpdatesContentType = .news
    var customWidget: CustomHomeWidget?
    @State var latestUpdateData: [String: CustomHomeWidget]
    var viewmodel = HomeVM()
//    let metaInfo: SILayoutBuilderModuleMetaInfo?
//    let widgetData: SILayoutBuilderWidgetDataItem?

    var body: some View {
        VStack {
            Text("Latest Updates")
                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 22))
                .position(CGPoint(x: 120.0, y: 10.0))
            
            HStack {
                ForEach(LatestUpdatesContentType.allCases, id: \.self) { contentType in
                    Button(action: {
                        self.selectedTab = contentType
                    }, label: {
                        Text(contentType.rawValue)
                            .frame(width: 78, height: 32)
                            .background(self.selectedTab == contentType ? Color(AppColorName.orange_F18700.rawValue) : Color.clear)
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(self.selectedTab == contentType ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.white_FFFFFF.rawValue), lineWidth: 1)
                            )
                    })
                }
            }
            .padding(.all, 40)
            
     
            switch selectedTab {
            case .news:
                NewsView(latestUpdateData: latestUpdateData)
            case .photos:
                PhotosView()
            case .videos:
                VideosView()
            }
        }
    }
}

//#Preview {
//    ContentHeader()
//}




//import SwiftUI
//
//// Define your view model
//class ArticleViewModel: ObservableObject {
//    @Published var selectedIndex: Int? = 0
//    @Published var currentContentType: LatestUpdatesContentType = .news
//    @Published var latestUpdateData: [String: SILayoutBuilderWidgetDataItem] = [:]
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
//
//// Define your article views
//struct ArticleLargeView: View {
//    let widgetData: SILayoutBuilderWidgetDataItem?
//    let metaInfo: SILayoutBuilderModuleMetaInfo?
//    let category: LatestUpdatesContentType
//
//    var body: some View {
//        VStack {
//            Text(widgetData?.titleAlias ?? "No Title")
//                .font(.headline)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//        }
//    }
//}
//
//struct ArticleSmallView: View {
//    let widgetData: SILayoutBuilderWidgetDataItem?
//    let metaInfo: SILayoutBuilderModuleMetaInfo?
//    let category: LatestUpdatesContentType
//
//    var body: some View {
//        VStack {
//            Text(widgetData?.titleAlias ?? "No Title")
//                .font(.subheadline)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(5)
//        }
//    }
//}
//
//// Define the category selection view
//import SwiftUI
//
//struct LatestUpdatesCategoryView: View {
//    let categories: [LatestUpdatesContentType]
//    let selectedIndex: Int?
//    let onSelect: (LatestUpdatesContentType) -> Void
//    
//    var body: some View {
//        HStack {
//            ForEach(categories, id: \.self) { category in
//                CategoryButton(category: category, isSelected: isSelected(category)) {
//                    onSelect(category)
//                }
//            }
//        }
//    }
//    
//    private func isSelected(_ category: LatestUpdatesContentType) -> Bool {
//        guard let selectedIndex = selectedIndex else {
//            return false
//        }
//        return categories[selectedIndex] == category
//    }
//
//    
//    struct CategoryButton: View {
//        let category: LatestUpdatesContentType
//        let isSelected: Bool
//        let action: () -> Void
//        
//        var body: some View {
//            Text(category.rawValue.capitalized)
//                .padding()
//                .background(isSelected ? Color.orange : Color.white)
//                .foregroundColor(isSelected ? Color.white : Color.black)
//                .cornerRadius(5)
//                .onTapGesture {
//                    action()
//                }
//        }
//    }
//}
//    
//    
//    // Define the main view
//struct ArticleHolderView: View {
//    @StateObject private var viewModel = ArticleViewModel()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                LatestUpdatesCategoryView(
//                    categories: viewModel.categories,
//                    selectedIndex: viewModel.selectedIndex,
//                    onSelect: { category in
//                        viewModel.selectCategory(category)
//                    }
//                )
//                
//                // Display the appropriate view based on the category
//                if let widgetData = viewModel.latestUpdateData[viewModel.currentContentType.rawValue] {
//                    if viewModel.currentContentType == .news {
//                        ArticleLargeView(
//                            widgetData: widgetData,
//                            metaInfo: nil, // Provide meta info if available
//                            category: viewModel.currentContentType
//                        )
//                    } 
//                } else {
//                    Text("No data available")
//                        .foregroundColor(.gray)
//                        .padding()
//                }
//            }
//            .navigationTitle("Latest Updates")
//        }
//    }
//}
//
//    
//    // Preview the main view
//    struct ArticleHolderView_Previews: PreviewProvider {
//        static var previews: some View {
//            ArticleHolderView()
//        }
//    }
//
