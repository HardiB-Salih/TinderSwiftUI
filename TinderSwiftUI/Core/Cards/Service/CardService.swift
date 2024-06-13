//
//  CardService.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import Foundation
struct CardService {
    
    func fetchCardModels() async throws -> [CardModel] {
        return CardModel.cardModelPlaceholdes
    }
}
