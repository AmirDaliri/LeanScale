//
//  Game.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

// MARK: - Game
public struct Game: Codable {
    
    public var id: Int?
    public var name: String?
    public var nameOriginal: String?
    public var gameDescription: String?
    public var metacritic: Int?
    public var backgroundImage: String?
    public var backgroundImageAdditional: String?
    public var website: String?
    public var redditurl: String?
    public var genres: [Genre]?


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case nameOriginal = "name_original"
        case gameDescription = "description"
        case metacritic = "metacritic"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website = "website"
        case redditurl = "reddit_url"
        case genres = "genres"
    }
    
    public init(id: Int?, name: String?, nameOriginal: String?, gameDescription: String?, metacritic: Int?, backgroundImage: String?, backgroundImageAdditional: String?, website: String?, redditurl: String?,genres: [Genre]?) {
        self.id = id
        self.name = name
        self.nameOriginal = nameOriginal
        self.gameDescription = gameDescription
        self.metacritic = metacritic
        self.backgroundImage = backgroundImage
        self.backgroundImageAdditional = backgroundImageAdditional
        self.website = website
        self.redditurl = redditurl
        self.genres = genres
    }
}
