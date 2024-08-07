//
//  ContentHeader.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.

import SwiftUI

struct ContentHeader: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.selectedTab = 0
                }, label: {
                    Text("News")
                        .frame(width: 78, height: 32)
                        .background(self.selectedTab == 0 ? Color(AppColorName.orange_F18700.rawValue) : Color.clear)
                        .foregroundColor(self.selectedTab == 0 ? Color(AppColorName.white_FFFFFF.rawValue) : Color(AppColorName.white_FFFFFF.rawValue))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(self.selectedTab == 0 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.white_FFFFFF.rawValue), lineWidth: 1)
                        )
                })

                Button(action: {
                    self.selectedTab = 1
                }, label: {
                    Text("Photos")
                        .frame(width: 78, height: 32)
                        .background(self.selectedTab == 1 ? Color(AppColorName.orange_F18700.rawValue) : Color.clear)
                        .foregroundColor(self.selectedTab == 1 ? Color(AppColorName.white_FFFFFF.rawValue) : Color(AppColorName.white_FFFFFF.rawValue))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(self.selectedTab == 1 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.white_FFFFFF.rawValue), lineWidth: 1)
                        )
                })

                Button(action: {
                    self.selectedTab = 2
                }, label: {
                    Text("Videos")
                        .frame(width: 78, height: 32)
                        .background(self.selectedTab == 2 ? Color(AppColorName.orange_F18700.rawValue) : Color.clear)
                        .foregroundColor(self.selectedTab == 2 ? Color(AppColorName.white_FFFFFF.rawValue) : Color(AppColorName.white_FFFFFF.rawValue))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(self.selectedTab == 2 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.white_FFFFFF.rawValue), lineWidth: 1)
                        )
                })

                Button(action: {
                    self.selectedTab = 3
                }, label: {
                    Text("More")
                        .frame(width: 78, height: 32)
                        .background(self.selectedTab == 3 ? Color(AppColorName.orange_F18700.rawValue) : Color.clear)
                        .foregroundColor(self.selectedTab == 3 ? Color(AppColorName.white_FFFFFF.rawValue) : Color(AppColorName.white_FFFFFF.rawValue))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(self.selectedTab == 3 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.white_FFFFFF.rawValue), lineWidth: 1)
                        )
                })
            }
            .padding(.all, 40)
            
            if selectedTab == 0 {
                NewsView()
            } else if selectedTab == 1 {
                PhotosView()
            }
          else {
               VideosView()
            }
        }
    }
}

#Preview {
    ContentHeader()
}
