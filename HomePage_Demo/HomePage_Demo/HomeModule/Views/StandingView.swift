//
//  StandingView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

import SwiftUI

struct  StandingView: View {
    let teams: [Team] = [
        Team(position: "Q1", name: "GT", matches: 14, wins: 10, losses: 4, netRunRate: "+0.809", points: 20, logo: "Team Logo"),
        Team(position: "Q2", name: "CSK", matches: 14, wins: 8, losses: 5, netRunRate: "+0.652", points: 17, logo: "Team Logo"),
        Team(position: "Q3", name: "RR", matches: 14, wins: 8, losses: 5, netRunRate: "+0.284", points: 17, logo: "Team Logo"),
        Team(position: "Q4", name: "MI", matches: 14, wins: 8, losses: 6, netRunRate: "-0.044", points: 16, logo: "Team Logo"),
        Team(position: "8", name: "LSG", matches: 14, wins: 3, losses: 11, netRunRate: "+0.148", points: 6, logo: "Team Logo")
    ]
    var body: some View {
        
        TableHeaderView()
        VStack {
                  
                   ForEach(teams) { team in
                       TeamRowView(team: team)
                   }
               }
               .padding()
               .background(Color(AppColorName.black_1A1A1A.rawValue))
               .foregroundColor(.white)
           }
        
    }

    



#Preview {
    StandingView()
}





