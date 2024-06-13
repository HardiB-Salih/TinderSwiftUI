//
//  UserInfoView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct UserInfoView: View {
    let user: User
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text(user.age.toString())
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                })
            }
            
            Text(user.bio)
        }
        .padding(20)
        .foregroundStyle(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    UserInfoView(user: .placeholder(5))
}
