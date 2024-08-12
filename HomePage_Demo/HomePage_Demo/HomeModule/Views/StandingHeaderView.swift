//
//  StandingHeaderView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

import SwiftUI
struct TableHeaderView: View {
    var body: some View {
        HStack {
            Text("POS")
            Spacer()
            Text("Team")
            Spacer()
            Text("M")
            Spacer()
            Text("W")
            Spacer()
            Text("L")
            Spacer()
            Text("NRR")
            Spacer()
            Text("PTS")
        }
        .font(.headline)
        .padding()
        .foregroundColor(Color(AppColorName.opaque_white_ffffff_20.rawValue))
        .background(Color(AppColorName.black_333333 .rawValue))
    }
}

struct TeamRowView: View {
    let team: Teams
    
    var body: some View {
        HStack {
            Text(team.position)
                .bold()
            Image(systemName: team.logo)
                .resizable()
                .frame(width: 30, height: 30)
            Text(team.name)
                .bold()
            Spacer()
            Text("\(team.matches)")
            Spacer()
            Text("\(team.wins)")
            Spacer()
            Text("\(team.losses)")
            Spacer()
            Text(team.netRunRate)
            Spacer()
            Text("\(team.points)")
                .bold()
        }
        .padding()
    }
}

#Preview {
    TableHeaderView()
}

struct Teams: Identifiable {
    let id = UUID()
    let position: String
    let name: String
    let matches: Int
    let wins: Int
    let losses: Int
    let netRunRate: String
    let points: Int
    let logo: String
}
