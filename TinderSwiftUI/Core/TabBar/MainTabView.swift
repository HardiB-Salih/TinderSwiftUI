//
//  MainTabView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            //MARK: - Swiping View
            CardStackView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? .flameFill : .flame)
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            //MARK: - Search View
            Text("Search View")
                .tabItem {
                    Image(systemName: .magnifyingglass)
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
 
            
            //MARK: - Inbox View
            Text("Inbox View")
                .tabItem {
                    VStack {
                        Image(selectedTab == 2 ? .communicationFill : .communication)
                    }
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            //MARK: - Profile View
            CurrentUserProfileView(user: .placeholder())
                .tabItem {
                    Image(systemName: selectedTab == 3 ? .personFill : .person)
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}


///size of a tab image 26 * 26
private extension String {
    static let communicationFill = "communication.fill"
    static let communication = "communication"
    static let tinder = "tinder"
    static let tinderFill = "tinder.fill"
    static let magnifyingglass = "magnifyingglass"
    static let person = "person"
    static let personFill = "person.fill"
    static let flame = "flame"
    static let flameFill = "flame.fill"
}
