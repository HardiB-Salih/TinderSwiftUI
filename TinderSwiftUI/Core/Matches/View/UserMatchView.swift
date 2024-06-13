//
//  UserMatchView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct UserMatchView: View {
    @Binding var show : Bool
    @EnvironmentObject var matchManager : MatchManager
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120) {
                VStack {
                    Image(.itsamatch)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .foregroundStyle(.white)
                    
                    if let matchedUser = matchManager.matchedUser {
                        Text("You and \(matchedUser.fullname) have liked eatchOther")
                            .foregroundStyle(.white)
                    }
                    
                }
                
                HStack (spacing: 16) {
                    Image(User.placeholder(2).profileImageUrls[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color(.systemGray6), lineWidth: 4)
                                .shadow(radius: 10)
                        }
                    
                    ///matched user
                    if let matchedUser = matchManager.matchedUser {
                        Image(matchedUser.profileImageUrls[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color(.systemGray6), lineWidth: 4)
                                    .shadow(radius: 10)
                            }
                    }
                    
                }
                
                VStack(spacing: 16 ) {
                    Button("Send Message") {
                        print("Send Message")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(Color(.systemPink))
                    .clipShape(Capsule())
                    
                    Button("Keep Swiping") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 2)
                    }
                    .clipShape(Capsule())
                    
                    
                    
                }
                
                
            }
           
        }
    }
}

#Preview {
    UserMatchView(show: .constant(false))
        .environmentObject(MatchManager())
}
