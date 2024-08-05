//
//  PageControl.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 05/08/24.
//
//import SwiftUI
//struct PageControl: View {
//    let numberOfPages: Int
//    @Binding var currentPage: Int
//
//    var body: some View {
//        HStack(spacing: 8) {
//            ForEach(0..<numberOfPages, id: \.self) { index in
//                Circle()
//                    .fill(index == currentPage ? Color(UIColor.getAppColor(colorName: .orange_F18700)) : Color.gray)
//                    .frame(width: 8, height: 8)
//            }
//        }
//        .padding(.top, 10)
//    }
//}
import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.primary : Color.secondary)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.top, 10)
    }
}
