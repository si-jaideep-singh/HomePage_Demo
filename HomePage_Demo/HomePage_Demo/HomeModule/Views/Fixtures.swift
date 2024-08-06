//
//  Fixtures.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

import SwiftUI

struct Fixtures: View {
    var body: some View {
        
        
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Fixtures")
            })
            .frame(width: 167,height: 46)
            .background(Color(AppColorName.orange_F18700.rawValue))
            .foregroundColor(Color(AppColorName.white_FFFFFF .rawValue))
            .cornerRadius(10)
           
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Standing")
                    .frame(width: 167,height: 46)
                    .background(Color(AppColorName.black_1A1A1A.rawValue))
                    .foregroundColor(Color(AppColorName.black_999999.rawValue))
                    .cornerRadius(10)
                   
                   
                
                    
            })
        }
        
        VStack(spacing : 20) {
        
         Image("fixtures_live")
                .frame(width: 80,height: 15)
                .background(Color(AppColorName.green_3AAA35 .rawValue))
                .cornerRadius(5)
                
                
                
            
            HStack {
                Image("fixtures_bat_image")
                 Text("Match 3")
                    .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                    .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                
                    HStack {
                        Image("fixtures_calendar")
                        
                        Text("1st April, 2023")
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    }
                    
                    HStack {
                        Image("fixtures_clock")
                        Text("19:30 (IST)")
                            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                            .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    }
                    
}
           
            
          
            HStack(spacing : 20) {
                VStack {
                    Image("Team Logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("LSG")
                        .font(.headline)
                }
                
                VStack {
                    Text("134/6")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                        
                    Text("(19.0)")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                       
                }
                
             Image("fixtures_vs")
                    .font(.headline)
                
                VStack {
                    Text("143/9")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                    Text("(20.0)")
                        .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                        .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                }
                
                VStack {
                    Image("Team Logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("PBKS")
                        .font(.headline)
                       }
               }
            .padding(.vertical, 10)
            
           
            Text("Lucknow Super Giants needs 10 runs in 6 balls")
                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 12))
                .padding()
            
            Divider()
                .background(Color.white)
                
            
            
            Spacer()
            
            
            Button(action: {
              
            }) {
                Text("Matchcenter")
                    .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
                    .font(.custom(UIFont.CustomFont.hindSemibold.rawValue, size: 14))
                   
            }
            .padding(.bottom, 10)
        }
        
        .frame(width: 375,height: 330)
        
        .background(Color(AppColorName.black_1A1A1A.rawValue))
        .foregroundColor(.white)
    }
}

#Preview {
    Fixtures()
}

