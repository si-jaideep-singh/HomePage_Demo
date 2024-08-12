//
//  SliderView.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 05/08/24.
//
import SwiftUI

struct SliderView: View {
    let slides: [Slide]
  
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(slides) { slide in
                            SlideView()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                    .offset(x: CGFloat(self.currentPage) * -geometry.size.width)
                }
                .onReceive(timer) { _ in
                    withAnimation {
                        self.currentPage = (self.currentPage + 1) % self.slides.count
                    }
                }
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            let threshold: CGFloat = 50
                            if value.translation.width > threshold {
                                self.currentPage = max(self.currentPage - 1, 0)
                            } else if value.translation.width < -threshold {
                                self.currentPage = min(self.currentPage + 1, self.slides.count - 1)
                            }
                        }
                )
            }
            .frame(height: 390)

            PageControl(numberOfPages: slides.count , currentPage: $currentPage)
        }
    }
}

