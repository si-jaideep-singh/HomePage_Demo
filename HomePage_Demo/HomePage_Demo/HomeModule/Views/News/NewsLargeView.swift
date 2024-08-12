//
//  NewsLargeView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//

//import SwiftUI
//
//struct NewsLargeView: View {
//    @StateObject var viewmodel = HomeVM()
//    var body: some View {
//       
//            VStack() {
//                ZStack{
//                    Image("BoardMembers")
//                        .resizable()
//                        .frame(width:346,height:193)
//                        .scaledToFill()
//                    Image("Overlay")
//                        .resizable()
//                        .frame(width:346,height:193)
//                        .scaledToFill()
//                }
//               
//               
//                Text("")
//                    .frame(height: 40)
//                    .lineSpacing(2)
//            
//                    .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
//                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
//                        .lineLimit(2)
//                       .padding(.horizontal,30)
//               
//                
//                HStack {
//                    Text("News")
//                        .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
//                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
//                    
//                    Image("dividerHorizontal")
//                    
//                    Image("fixtures_calendar")
//                    Text("15 may, 2023")
//                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
//                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
//                    Image("dividerHorizontal")
//                    Text("20min read")
//                        .foregroundColor(Color(AppColorName.black_999999.rawValue))
//                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
//                    
//                    
//                }
//                .padding(.bottom,30)
//            }
//            
//            .frame(width: 346 ,height: 252)
//            .background(Color(AppColorName.black_1A1A1A.rawValue))
//            
//            
//            
//        }
//    }
//
//
//#Preview {
//    NewsLargeView()
//}

import SwiftUI

struct NewsLargeView: View {
    @StateObject private var viewModel = HomeVM()
    @State private var isLoading = false
    @State private var errorMessage: String?
    var widgetData: SILayoutBuilderWidgetDataItem?
    var metaInfo: SILayoutBuilderModuleMetaInfo?
  
  
   
//    let category: ContentType
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                VStack {
                    ZStack {
                        Image("BoardMembers")
                            .resizable()
                            .frame(width: 346, height: 193)
                            .scaledToFill()
                        Image("Overlay")
                            .resizable()
                            .frame(width: 346, height: 193)
                            .scaledToFill()
                    }
                    
                    if let shortDesc = viewModel.shortDesc {
                        Text(shortDesc)
                            .frame(height: 40)
                            .lineSpacing(2)
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
                            .lineLimit(2)
                            .padding(.horizontal, 30)
                    } else {
                        Text("No description available")
                            .frame(height: 40)
                            .lineSpacing(2)
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
                            .lineLimit(2)
                            .padding(.horizontal, 30)
                    }
                    
                    HStack {
                        Text("News")
                            .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                        
                        Image("dividerHorizontal")
                        
                        Image("fixtures_calendar")
                        Text("15 May, 2023")
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                        Image("dividerHorizontal")
                        Text("20min read")
                            .foregroundColor(Color(AppColorName.black_999999.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    }
                    .padding(.bottom, 30)
                }
                .frame(width: 346, height: 252)
                .background(Color(AppColorName.black_1A1A1A.rawValue))
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() {
        isLoading = true
        errorMessage = nil
        
        viewModel.getLayoutBuilderData { success in
            isLoading = false
            if !success {
                errorMessage = "Failed to load data."
            }
        }
    }
}

struct NewsLargeView_Previews: PreviewProvider {
    static var previews: some View {
        NewsLargeView()
    }
}
