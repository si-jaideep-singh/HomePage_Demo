//
//  SquadView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

//import SwiftUI
//


struct SquadMember: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let role: String
    let image: String
}


import SwiftUI

struct SquadView: View {
    let member: SquadMember
    let zoomFactor: CGFloat = 0.8
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Image(member.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 250)
                        .clipped()
                    
                    Image("lsgHome_playerSquadGradientCenter")
                        .padding(.top, 100)
                    
                    VStack {
                        Text(member.firstName)
                            .foregroundColor(Color("white_FFFFFF"))
                            .font(.custom("hindSemibold", size: 14))
                        Text(member.lastName)
                            .foregroundColor(Color("white_FFFFFF"))
                            .font(.custom("hindBold", size: 19))
                        
                        Text(member.role)
                            .padding(.vertical, 10)
                            .frame(width: 70, height: 14)
                            .foregroundColor(Color("white_FFFFFF"))
                            .font(.custom("hindSemibold", size: 12))
                            .background(Color("blue_022464").opacity(0.4))
                            .cornerRadius(10)
                        
                        HStack {
                            Image("lsg_newCaptain")
                            Image("lsg_planeSign")
                        }
                    }
                    .padding(.top, 120)
                }
            }
            .scaleEffect(self.scaleEffect(for: geometry.frame(in: .global).midX))
            .animation(.easeInOut(duration: 0.3), value: geometry.frame(in: .global).midX)
        }
        .frame(width: 220, height: 270)
    }
    
    private func scaleEffect(for x: CGFloat) -> CGFloat {
        let midX = UIScreen.main.bounds.midX
        let distance = abs(midX - x)
        let scale = max(1 - distance / midX, zoomFactor)
        return scale
    }
}


