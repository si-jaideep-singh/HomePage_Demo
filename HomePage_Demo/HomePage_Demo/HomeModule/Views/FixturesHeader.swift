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
                    Text("Fixtures")
                })
                .frame(width: 167, height: 46)
                .background(self.selectedTab == 0 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.black_1A1A1A.rawValue))
                    
                .foregroundColor(self.selectedTab == 0 ? Color(AppColorName.white_FFFFFF .rawValue) : Color(AppColorName.black_1A1A1A.rawValue))

                .cornerRadius(10)

                Button(action: {
                    self.selectedTab = 1
                }, label: {
                    Text("Standing")
                })
                .frame(width: 167, height: 46)
                .background(self.selectedTab == 1 ? Color(AppColorName.orange_F18700.rawValue) : Color(AppColorName.black_1A1A1A.rawValue))
                    
                .foregroundColor(self.selectedTab == 1 ? Color(AppColorName.white_FFFFFF .rawValue) : Color(AppColorName.black_1A1A1A.rawValue))

                .cornerRadius(10)
            }
            
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
