//
//  User.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id : String
    let fullname: String
    var age: Int
    var profileImageUrls: [String]
    var bio: String
}


extension User: Hashable { }

extension User {
    static func placeholder(
        _ index: Int = 0
    ) -> User {
        let actor = generateActors()[index]
        return .init(
            id: actor.id.uuidString,
            fullname: actor.fullName,
            age: 34,
            profileImageUrls: actor.images,
            bio: "Some test bio for now"
        )
    }
    
    static var placeHolderUsers : [User] {
        return generateActors().compactMap { actor in
            User(
                id: actor.id.uuidString,
                fullname: actor.fullName,
                age: actor.age,
                profileImageUrls: actor.images,
                bio: "Some test bio for now"
            )
        }
    }
}
