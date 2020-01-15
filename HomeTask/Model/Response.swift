//
//  Response.swift
//  HomeTask
//
//  Created by Yin Hua on 14/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

struct Response: Codable {
    var title: String?
    var details: [Detail]?
    
    enum CodingKeys: String, CodingKey
    {
        case title
        case details = "rows"
    }
}

struct Detail: Codable {
    var title: String?
    var description: String?
    var imageURL: URL?
    
    enum CodingKeys: String, CodingKey
    {
        case title
        case description
        case imageURL = "imageHref"
    }
}
