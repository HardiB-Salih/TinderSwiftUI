//
//  TinderSwiftUIApp.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

@main
struct TinderSwiftUIApp: App {
    @StateObject var matchManager = MatchManager()
    
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
