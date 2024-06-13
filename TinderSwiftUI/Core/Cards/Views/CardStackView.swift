//
//  CardStackView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(service: CardService())
    
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { cards in
                CardView(viewModel: viewModel, model: cards)
            }
        }
        .onChange(of: viewModel.cardModels) { oldValue, newValue in
            print("DEBUG: oldValue is \(oldValue.count)")
            print("DEBUG: newValue is \(newValue.count)")
        }
    }
}

#Preview {
    CardStackView()
}
