//
//  PlatformPlatform.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct PlatformPlatform: Codable {
    public var id: Int?
    public var name: String?
    public var slug: String?
    public var image: JSONNull?
    public var yearEnd: JSONNull?
    public var yearStart: Int?
    public var gamesCount: Int?
    public var imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case image = "image"
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }

    public init(id: Int?, name: String?, slug: String?, image: JSONNull?, yearEnd: JSONNull?, yearStart: Int?, gamesCount: Int?, imageBackground: String?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.image = image
        self.yearEnd = yearEnd
        self.yearStart = yearStart
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
    }
}
