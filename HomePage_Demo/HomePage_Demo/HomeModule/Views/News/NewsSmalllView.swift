//
//  NewsSmalllView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

import SwiftUI

struct NewsSmalllView: View {
    
//    var viewmodel = HomeVM()
    
    var widgetData: SILayoutBuilderWidgetDataItem?
    var metaInfo: SILayoutBuilderModuleMetaInfo?
   // var widgetData : SILayoutBuilderWidgetDataItem
    var body: some View {
       
            HStack{
                ZStack(alignment: .bottomLeading) {
                               Image("BoardMembers")
                                   .resizable()
                                   .scaledToFit()
                                   .cornerRadius(10.0)
                               
                               Text("5 Mins Read")
                                   .padding(4)
                                   .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                                   .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 11))
                                   .background(Color(AppColorName.black_000000.rawValue).opacity(0.8))
                                   .cornerRadius(2)
                                   .padding(.bottom, 5)
                                   .padding(.leading, 5)
                           }
                          

                 VStack(alignment : .leading, spacing :10){
                    Image("menu_icon_2")
                      
                     Text("Jaideep")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
//                       .lineLimit(3)
//                       .padding(.horizontal,10)
                    HStack{
                        Text("NEWS")
                            .foregroundColor(Color(AppColorName.orange_F18700 .rawValue))
                        Image("dividerHorizontal")
                        Image("fixtures_calendar")
                        Text("15 may, 2023")
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                    }
                  
                    .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
              
               }
                .frame(width:183,height: 116)
                .padding(.horizontal,10)
               
//                Spacer()
            }
            
           
            .frame(width: 340,height: 116)
            .background(Color(AppColorName.black_1A1A1A.rawValue))
            
            
        }
    }


#Preview {
    NewsSmalllView()
}

