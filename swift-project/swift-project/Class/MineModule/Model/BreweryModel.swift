//
//  BreweryModel.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/27.
//  Copyright © 2019 Herriat. All rights reserved.
//

import Foundation

struct PagedBreweries : Codable {
    struct Meta : Codable {
        let page: Int
        let totalPages: Int
        let perPage: Int
        let totalRecords: Int
        enum CodingKeys : String, CodingKey {
            case page
            case totalPages = "total_pages"
            case perPage = "per_page"
            case totalRecords = "total_records"
        }
    }

    struct Brewery : Codable {
        let id: Int
        let name: String
    }

    let meta: Meta
    let breweries: [Brewery]
}
