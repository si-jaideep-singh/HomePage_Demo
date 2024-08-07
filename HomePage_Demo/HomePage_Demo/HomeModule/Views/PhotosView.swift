//
//  PhotosView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 07/08/24.
//

import SwiftUI

struct PhotosView: View {
    var body: some View {
       PhotosLargeView()
        Divider()
            .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
        ForEach(0..<4) {
            _ in
            PhotosSmalllView()
            Divider()
                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
        }
      
        
    }
}

#Preview {
    PhotosView()
}
