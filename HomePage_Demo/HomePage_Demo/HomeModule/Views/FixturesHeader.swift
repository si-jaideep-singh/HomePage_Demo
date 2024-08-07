//
//  FixturesHeader.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//


import SwiftUI

struct FixturesHeader: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.selectedTab = 0
                }, label: {
                    Text("Videos")
                        .frame(width: 167, height: 47)
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
                    Text("Standing")
                        .frame(width: 167, height: 47)
                        .background(self.selectedTab == 1 ? Color(AppColorName.orange_F18700.rawValue) : Color.clear)
                        .foregroundColor(self.selectedTab == 1 ? Color(AppColorName.white_FFFFFF.rawValue) : Color(AppColorName.white_FFFFFF.rawValue))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(self.selectedTab == 1 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.white_FFFFFF.rawValue), lineWidth: 1)
                        )
                })            }
            
            if selectedTab == 0 {
                Fixtures()
            } else {
                StandingView()
            }
        }
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
                Text("ViewAll")
                
                    .frame(width: 345, height: 44)
                    .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
                    .border(Color(AppColorName.orange_F18700.rawValue))
                .cornerRadius(3)
               
            }
        })
    }
}

#Preview {
    FixturesHeader()
}
