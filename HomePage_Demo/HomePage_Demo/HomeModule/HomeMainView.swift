//
//  HomeMainView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 05/08/24.
//
import SwiftUI

struct HomeMainView: View {
    @StateObject var viewModel = HomeVM()
    var actualHomeLayouts: [SILayoutBuilderWidget] = []
//    let metaInfo: SILayoutBuilderModuleMetaInfo
//    let widgetData: SILayoutBuilderWidgetDataItem
//    @State var latestUpdateData: [String: CustomHomeWidget]
    var currentContentType:  LatestUpdatesContentType = .news
   
    
    
    var body: some View {
        let slides = [
            Slide(imageName: "BoardMembers", overlayName: "Overlay", newsTitle: "News", newsDescription: "LSG add six players at the auction to bolster the squad ahead of IPL 2024"),
            Slide(imageName: "BoardMembers", overlayName: "Overlay", newsTitle: "News", newsDescription: "LSG add six players at the auction to bolster the squad ahead of IPL 2024")
            // Add more slides here
        ]
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                SliderView(slides: slides)
                FixturesHeader()
                SquadMainView()
                PollView()
                ContentHeader(latestUpdateData: viewModel.LatestUpdateDataDictionary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(AppColorName.black_1A1A1A.rawValue))
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear() {
           
          setupLayoutBuilder()
        }
    }
    
    func setupLayoutBuilder() {
        viewModel.getLayoutBuilderData { success in
            guard success else { return }
            
           
        }
    }
}





//#Preview {
//    HomeMainView( latestUpdateData: )
//}






