//
//  HomePage_DemoApp.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 05/08/24.
//

import SwiftUI

@main
struct HomePage_DemoApp: App {
    @StateObject var viewModel = HomeVM()

    var body: some Scene {
        WindowGroup {
            HomeMainView()
        }
    }
}
