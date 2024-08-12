//
//  PollView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//
import SwiftUI
struct PollView: View {
    let pollQuestion: String = "Which Lucknow Super Giants spinner will pick more wickets for India at the IPL 2023?"
    let options: [PollOptions] = [
        PollOptions(name: "Ravi Bishnoi", percentage: 50, color: .blue),
        PollOptions(name: "Amit Mishra", percentage: 30, color: .gray),
        PollOptions(name: "M. Siddharth", percentage: 10, color: .gray),
        PollOptions(name: "Arshad Khan", percentage: 10, color: .gray)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Fan Poll")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 8)
                .padding(.leading, 8)
            
            Text(pollQuestion)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
            
            ForEach(options) { option in
                PollOptionView(option: option)
            }
            
            Text("Thank you for Vote")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.6))
                .cornerRadius(8)
                .padding(.horizontal, 8)
        }
        .padding()
        .cornerRadius(16)
        .shadow(radius: 8)
        .padding()
    }
}

struct PollView_Previews: PreviewProvider {
    static var previews: some View {
        PollView()
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
    }
}
