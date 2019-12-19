//
//  HomeModel.swift
//  Bandio
//
//  Created by DP on 12/17/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import Foundation
struct HomeModel : Codable {
    let stat : Int?
    let msg : String?
    let slider : [Slider]?
    let home : [Home]?
    
    enum CodingKeys: String, CodingKey {
        
        case stat = "stat"
        case msg = "msg"
        case slider = "slider"
        case home = "home"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stat = try values.decodeIfPresent(Int.self, forKey: .stat)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        slider = try values.decodeIfPresent([Slider].self, forKey: .slider)
        home = try values.decodeIfPresent([Home].self, forKey: .home)
    }
    

struct Home : Codable {
    let id : String?
    let img : String?
    let text : String?
    let type : String?
    let created_at : String?
    let updated_at : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case img = "img"
        case text = "text"
        case type = "type"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        img = try values.decodeIfPresent(String.self, forKey: .img)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }
    
}

    struct Slider : Codable {
        let id : String?
        let img : String?
        let text : String?
        let type : String?
        let created_at : String?
        let updated_at : String?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case img = "img"
            case text = "text"
            case type = "type"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            img = try values.decodeIfPresent(String.self, forKey: .img)
            text = try values.decodeIfPresent(String.self, forKey: .text)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }
        
    }


}
