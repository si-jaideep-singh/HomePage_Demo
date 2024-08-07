//
//  SquadHeaderView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//

import SwiftUI

struct SquadHeaderView: View {
    var body: some View {
        
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("LSG Squad")
                    .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                    .font(.custom(UIFont.CustomFont.hindBold.rawValue, size: 20))
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("View all")
                    .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
                    .font(.custom(UIFont.CustomFont.hindBold.rawValue, size: 11))
            })
        }
        .background(Image("lsg_HomeSquad_Bg"))
        .padding(20)
       
     
        
        
       
        
      
            
            
        }
    }


#Preview {
    SquadHeaderView()
}
