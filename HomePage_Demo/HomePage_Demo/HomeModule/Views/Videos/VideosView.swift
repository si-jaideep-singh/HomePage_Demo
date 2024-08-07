//
//  VideosView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//

import SwiftUI

struct VideosView: View {
    var body: some View {
       VideosLargeView()
        Divider()
            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
        ForEach(0..<4) {
            _ in
           VideosSmalllView()
            Divider()
                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
        }
      
        
    }
}

#Preview {
    VideosView()
}

