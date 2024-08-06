//
//  NewsSmalllView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

import SwiftUI

struct NewsSmalllView: View {
    var body: some View {
        VStack{
            HStack(){
                Image("BoardMembers")
                    .resizable()
                    .scaledToFit()
                    .frame(width:152,height: 114)
//                    .padding(.zero)
             
               
                VStack(alignment : .leading, spacing :10){
                    Image("menu_icon_2")
                      
                    Text("IPL Playoffs Take 2: Comeback Heroes Lucknow Super Giants Take On ")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
                    
                        .lineLimit(2)
                    HStack{
                        Text("NEWS")
                            .foregroundColor(Color(AppColorName.orange_F18700 .rawValue))
                        Image("fixtures_calendar")
                        Text("15 may, 2023")
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                    }
                  
                    .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
              
               }
                .frame(width:183,height: 114)
                .padding()
                
            }
            
            .frame(width: 345,height: 116)
            .background(Color(AppColorName.black_1A1A1A.rawValue))
            
            
        }
    }
}

#Preview {
    NewsSmalllView()
}
