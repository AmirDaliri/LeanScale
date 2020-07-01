//
//  GamesResult.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct GamesResult: Codable {
    public var id: Int?
    public var name: String?
    public var backgroundImage: String?
    public var metacritic: Int?
    public var genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case backgroundImage = "background_image"
        case metacritic = "metacritic"
        case genres = "genres"
    }

    public init(id: Int?, name: String?, backgroundImage: String?, metacritic: Int?, genres: [Genre]?) {
        self.id = id
        self.name = name
        self.backgroundImage = backgroundImage
        self.metacritic = metacritic
        self.genres = genres
    }
}
