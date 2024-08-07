//
//  VideosLargeView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//

import SwiftUI

struct VideosLargeView: View {
    var body: some View {
       
            VStack() {
                ZStack{
                    Image("BoardMembers")
                        .resizable()
                        .frame(width:346,height:193)
                        .scaledToFill()
                    Image("Overlay")
                        .resizable()
                        .frame(width:346,height:193)
                        .scaledToFill()
                }
               
               
                    Text("How did Lucknow Super Giants qualify for IPL playoffs: Second time's the charm for LSG?")
                    .frame(height: 40)
                    .lineSpacing(2)
            
                    .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
                        .lineLimit(2)
                       .padding(.horizontal,30)
               
                
                HStack {
                    Text("News")
                        .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    
                    Image("dividerHorizontal")
                    
                    Image("fixtures_calendar")
                    Text("15 may, 2023")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    Image("dividerHorizontal")
                    Text("20min read")
                        .foregroundColor(Color(AppColorName.black_999999.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    
                    
                }
                .padding(.bottom,30)
            }
            
            .frame(width: 346 ,height: 252)
            .background(Color(AppColorName.black_1A1A1A.rawValue))
            
            
            
        }
    }


#Preview {
    VideosLargeView()
}
