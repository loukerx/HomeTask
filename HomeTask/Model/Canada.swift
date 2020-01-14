//
//  Canada.swift
//  HomeTask
//
//  Created by Yin Hua on 14/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

struct Canada: Codable {
    var title: String?
    var details: [Detail]?
    
    enum CodingKeys: String, CodingKey
    {
        case title
        case details = "rows"
    }
}
