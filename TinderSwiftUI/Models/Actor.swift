//
//  Actor.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import Foundation
import SwiftUI

struct Actor: Identifiable {
    let id = UUID()
    let age: Int
    let fullName: String
    let email: String
    let username: String
    let imageName: String
    let images: [String]
}

extension Actor: Hashable { }


func generateActors() -> [Actor] {
    let names = [
        ("Tom Holland", "Tom Holland"),
        ("Timothée Chalamet", "Timothee Chalamet"),
        ("Chris Hemsworth", "Chris Hemsworth"),
        ("Michael B. Jordan", "Michael B Jordan"),
        ("Robert Pattinson", "Robert Pattinson"),
        ("Zendaya", "Zendaya"),
        ("Emma Watson", "Emma Watson"),
        ("Scarlett Johansson", "Scarlett Johansson"),
        ("Millie Bobby Brown", "Millie Bobby Brown"),
        ("Jennifer Lawrence", "Jennifer Lawrence")
    ]
    
    var actors = [Actor]()

    for name in names {
        let fullName = name.0
        let age = Int.random(in: 25...40)
        let username = fullName.lowercased().replacingOccurrences(of: " ", with: "-")
        let email = "\(username)@email.com"
        let imageName = (0..<3).map { "\(username)\($0)" }.randomElement() ?? "\(username)0"
        let images = (0..<3).map { "\(username)\($0)" }
        
        let actor = Actor(
            age: age,
            fullName: fullName,
            email: email,
            username: username,
            imageName: imageName,
            images: images
        )
        actors.append(actor)
    }
    
    return actors
}


extension Actor {
    static let placeholder = generateActors()[9]
}

//// Example usage
//let actors = generateActors()
//for actor in actors {
//    print("Full Name: \(actor.fullName), Email: \(actor.email), Username: \(actor.username), Image Name: \(actor.imageName), Images: \(actor.images)")
//}
