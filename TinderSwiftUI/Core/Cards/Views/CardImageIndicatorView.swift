//
//  CardImageIndicatorView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self ) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width:imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}


extension CardImageIndicatorView {
    var imageIndicatorWidth : CGFloat {
        return (SizeConstants.cardWidth / imageCount.toCGFloat()) - 28
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: 1, imageCount: 3)
        .preferredColorScheme(.dark)
}
