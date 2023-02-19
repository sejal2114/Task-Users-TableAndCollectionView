//
//  Users.swift
//  Task-Users-Table-Collection
//
//  Created by Sejal on 19/02/23.
//

import Foundation

struct Root: Decodable {
    let total: Int
    let users: [User]
}

struct User: Decodable {
    let firstName: String
    let lastName: String
    let maidenName: String
    let image: String
    let eyeColor: String
    let gender: String
    let hair: Hair
    
}

struct Hair: Decodable {
    let color: String
    let type: String
}
