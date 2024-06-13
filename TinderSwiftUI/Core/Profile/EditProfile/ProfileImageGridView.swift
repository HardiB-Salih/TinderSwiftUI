//
//  ProfileImageGridView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct ProfileImageGridView: View {
    let user: User
    
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0 ..< 6) { index in
                if index < user.profileImageUrls.count {
                    Image(user.profileImageUrls[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                } else {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color(.secondarySystemBackground))
                        .frame(width: imageWidth, height: imageHeight)
                        .overlay(alignment: .bottomTrailing) {
                            Image(systemName: "plus.circle.fill")
                                .imageScale(.large)
                                .foregroundStyle(Color(.systemPink))
                                .padding(5)
                        }
                }
            }
        }
    }
}

private extension ProfileImageGridView {
    private var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    }
    
    var imageWidth: CGFloat { 110 }
    var imageHeight: CGFloat { 160 }

}

#Preview {
    ProfileImageGridView(user: .placeholder(9))
}
