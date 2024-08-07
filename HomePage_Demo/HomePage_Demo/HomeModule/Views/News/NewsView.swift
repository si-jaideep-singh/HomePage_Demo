//
//  NewsView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 06/08/24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
       NewsLargeView()
        Divider()
            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
        ForEach(0..<4) {
            _ in
            NewsSmalllView()
            Divider()
                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
        }
      
        
    }
}

#Preview {
    NewsView()
}
