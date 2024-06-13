//
//  CurrentUserProfileView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    @State var showEditPage : Bool = false
    var body: some View {
        NavigationStack {
            List {
                //MARK: - Header View
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditPage.toggle()
                    }
                
                
                //MARK: - Account Info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(user.email)
                    }
                }
                //MARK: - Legal
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                //MARK: - Logout/delete
                Section {
                    Button("Logout") { }
                }
                
                Section {
                    Button("Delete Account") { }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditPage, content: {
                EditProfileView(user: user)
            })
        }
    }
}

#Preview {
    CurrentUserProfileView(user: .placeholder(7))
}
