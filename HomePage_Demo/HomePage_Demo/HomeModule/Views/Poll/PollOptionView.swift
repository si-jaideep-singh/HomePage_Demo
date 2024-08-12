//
//  PollOptionView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//
import SwiftUI
struct PollOptionView: View {
    let option: PollOptions
    
    var body: some View {
        HStack {
            Text(option.name)
                .foregroundColor(.white)
                .padding(.leading, 8)
            Spacer()
            Text("\(Int(option.percentage))%")
                .foregroundColor(.white)
                .padding(.trailing, 8)
        }
        .frame(height: 40)
        .background(option.color)
        .cornerRadius(8)
        .padding(.horizontal, 8)
    }
}


import SwiftUI

struct PollOptions: Identifiable {
    let id = UUID()
    let name: String
    let percentage: CGFloat
    let color: Color
}

