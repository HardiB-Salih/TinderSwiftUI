//
//  CardStackView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct CardStackView: View {
    @State private var showMatchView = false
    @StateObject var viewModel = CardViewModel(service: CardService())
    @EnvironmentObject var matchManager : MatchManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack (spacing: 20){
                    ZStack {
                        ForEach(viewModel.cardModels) { cards in
                            CardView(viewModel: viewModel, model: cards)
                        }
                    }
                    
                    if viewModel.cardModels.isNotEmpty {
                        SwipeActionButtonsView(viewModel: viewModel)
                    }
                }
                .blur(radius: showMatchView ? 20 : 0)
                
                
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeInOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser , perform: { user in
                showMatchView = user != nil
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack (spacing: 0){
                        Image("tinderLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        
                        Text("Tinder")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color(.systemPink), Color.primary]), startPoint: .leading, endPoint: .trailing))
                    }
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        CardStackView()
            .environmentObject(MatchManager())
    }
}
