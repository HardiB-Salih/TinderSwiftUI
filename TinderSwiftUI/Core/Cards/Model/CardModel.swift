//
//  CardModel.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import Combine
import SwiftUI

struct CardModel  {
    let user: User
}

extension CardModel: Identifiable {
    var id: String { return user.id }
}



//MARK: Hashable
extension CardModel: Hashable { }

// MARK: - Placeholdes
extension CardModel {
    static var cardModelPlaceholdes : [CardModel]  {
        return User.placeHolderUsers.compactMap({ CardModel(user: $0) })
    }
}
