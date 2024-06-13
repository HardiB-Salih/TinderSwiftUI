//
//  UserProfileView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State private var currentImageIndex: Int = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text(user.fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user.age.toString())
                        .font(.title2)
                }
                
                Spacer()
                
                Button(action: { dismiss() }, label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .foregroundStyle(Color(.systemPink))
                        .imageScale(.large)
                        .fontWeight(.bold)
                })
                
   

            }.padding(.horizontal)
            
            ScrollView {
                VStack {
                    ZStack (alignment: .top) {
                        Image(user.profileImageUrls[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .overlay { ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageUrls.count) }
                        
                        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageUrls.count)
                    }
                    
                    VStack (alignment: .leading, spacing: 12){
                        Text("About me")
                            .fontWeight(.semibold)
                        
                        if let bio = user.bio {
                            Text(bio)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding()
                    
                    
                    
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Essentials")
                            .fontWeight(.semibold)
                        
                        HStack{
                            Image(systemName: "person")
                            Text("Woman")
                            Spacer()
                        }
                        HStack{
                            Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                            Text("Straight")
                            Spacer()
                        }
                        
                        HStack{
                            Image(systemName: "book")
                            Text("Actress")
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding()

                }
            }
        }
    }
}

//#Preview {
//    UserProfileView(user: .placeholder())
//}
