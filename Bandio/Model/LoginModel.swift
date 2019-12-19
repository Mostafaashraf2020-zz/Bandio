//
//  LoginModel.swift
//  Bandio
//
//  Created by DP on 12/15/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import Foundation
struct LoginModel : Codable {
    let stat : Int?
    let msg : String?
    let user : User?
    
    enum CodingKeys: String, CodingKey {
        
        case stat = "stat"
        case msg = "msg"
        case user = "user"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stat = try values.decodeIfPresent(Int.self, forKey: .stat)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        user = try values.decodeIfPresent(User.self, forKey: .user)
    }
    struct User : Codable {
        let id : Int?
        let username : String?
        let email : String?
        let birthdate : String?
        let token : String?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case username = "username"
            case email = "email"
            case birthdate = "birthdate"
            case token = "token"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            username = try values.decodeIfPresent(String.self, forKey: .username)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            birthdate = try values.decodeIfPresent(String.self, forKey: .birthdate)
            token = try values.decodeIfPresent(String.self, forKey: .token)
        }
        
    }

    
    
}
