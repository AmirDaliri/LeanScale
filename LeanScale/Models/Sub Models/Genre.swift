//
//  Genre.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Genre: Codable {
    public var id: Int?
    public var name: String?
    public var slug: String?
    public var gamesCount: Int?
    public var imageBackground: String?
    public var domain: String?
    public var language: Language?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain = "domain"
        case language = "language"
    }

    public init(id: Int?, name: String?, slug: String?, gamesCount: Int?, imageBackground: String?, domain: String?, language: Language?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
        self.domain = domain
        self.language = language
    }
}
