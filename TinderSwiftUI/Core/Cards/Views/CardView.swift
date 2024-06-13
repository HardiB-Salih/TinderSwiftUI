//
//  CardView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: CGFloat = 0
    @State private var currentImageIndex: Int = 0
    
//    let images = generateActors()[1].images
    let model: CardModel
    
    var body: some View {
        ZStack ( alignment: .bottom ) {
            ZStack (alignment: .top){
                Image(user.profileImageUrls[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay { ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount) }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView(user: user)
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .offset(x: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
}

private extension CardView {
    //MARK: onDragChanged
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value ){
        xOffset = value.translation.width
        degrees = (value.translation.width / 25).toDouble()
    }
    
    //MARK: onDragEnded
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value ) {
        let width = value.translation.width
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
        
        
        
    }
}


#Preview {
    CardView(
        viewModel: CardViewModel(
            service: CardService()
        ),
        model: .cardModelPlaceholdes[1]
    )
}
