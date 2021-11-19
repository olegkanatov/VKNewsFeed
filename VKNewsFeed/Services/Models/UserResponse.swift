//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 19.11.21.
//

import Foundation

struct UserResponseWrapped: Decodable {
    
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    
    let photo100: String?
}
