//
//  Safety_FirstApp.swift
//  Safety First
//
//  Created by Farzana  on 9/18/23.
//

import SwiftUI

@main
struct Safety_FirstApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router.shared)
                .environmentObject(FavoritePages.favorite)
        }
    }
}
