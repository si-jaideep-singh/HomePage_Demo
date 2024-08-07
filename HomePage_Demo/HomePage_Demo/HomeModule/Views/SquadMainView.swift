//
//  SquadMainView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.


import SwiftUI

struct SquadMainView: View {
    let members: [SquadMember] = [
        SquadMember(firstName: "KL", lastName: "Rahul", role: "Batter", image: "playerImage"),
        SquadMember(firstName: "KL", lastName: "Rahul", role: "Batter", image: "playerImage"),
        SquadMember(firstName: "KL", lastName: "Rahul", role: "Batter", image: "playerImage"),
        SquadMember(firstName: "KL", lastName: "Rahul", role: "Batter", image: "playerImage"),
        SquadMember(firstName: "KL", lastName: "Rahul", role: "Batter", image: "playerImage")
        // Add more squad members here
    ]
    
    var body: some View {
        SquadHeaderView()
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 50) {
                ForEach(members) { member in
                    SquadView(member: member)
                }
            }
            .padding(.horizontal, 50)
        }
        .frame(height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SquadMainView()
    }
}

