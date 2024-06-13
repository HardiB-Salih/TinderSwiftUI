//
//  MatchManager.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser : User?
    
    func checkForMatch(withUser user: User){
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}
