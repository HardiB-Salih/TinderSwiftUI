//
//  SwipeActionButtonsView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        HStack (spacing: 32 ){
            Button {
                viewModel.buttonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow( color: .black.opacity(0.3), radius: 5))
            }
            .frame(width: 48, height: 48)
            
            Button {
                viewModel.buttonSwipeAction = .like
            } label: {
                Image(systemName: "suit.heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.teal)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow( color: .black.opacity(0.3), radius: 5)
                    )
            }
            .frame(width: 48, height: 48)
            
        }
        
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardViewModel(service: CardService()))
}
