//
//  CardViewModel.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

class CardViewModel : ObservableObject {
    @Published var cardModels : [CardModel] = []
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: Faild to fetch card Models \(error.localizedDescription)")
        }
    }
    
    /// Removes the specified card from the collection of card models.
    ///
    /// This method searches for the card in the `cardModels` array by matching the `id` property.
    /// If the card is found, it is removed from the array.
    ///
    /// - Parameter card: The `CardModel` instance to be removed from the `cardModels` array.
    ///
    /// - Returns: This method does not return any value.
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)
    }

    
    
    
    
}
