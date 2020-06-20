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
    public var slug: String?
    public var name: String?
    public var released: String?
    public var tba: Bool?
    public var backgroundImage: String?
    public var rating: Double?
    public var ratingTop: Int?
    public var ratings: [Rating]?
    public var ratingsCount: Int?
    public var reviewsTextCount: Int?
    public var added: Int?
    public var addedByStatus: AddedByStatus?
    public var metacritic: Int?
    public var playtime: Int?
    public var suggestionsCount: Int?
    public var userGame: JSONNull?
    public var reviewsCount: Int?
    public var saturatedColor: ColorRes?
    public var dominantColor: ColorRes?
    public var platforms: [PlatformElement]?
    public var parentPlatforms: [ParentPlatform]?
    public var genres: [Genre]?
    public var stores: [Store]?
    public var clip: Clip?
    public var tags: [Genre]?
    public var shortScreenshots: [ShortScreenshot]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case name = "name"
        case released = "released"
        case tba = "tba"
        case backgroundImage = "background_image"
        case rating = "rating"
        case ratingTop = "rating_top"
        case ratings = "ratings"
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added = "added"
        case addedByStatus = "added_by_status"
        case metacritic = "metacritic"
        case playtime = "playtime"
        case suggestionsCount = "suggestions_count"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms = "platforms"
        case parentPlatforms = "parent_platforms"
        case genres = "genres"
        case stores = "stores"
        case clip = "clip"
        case tags = "tags"
        case shortScreenshots = "short_screenshots"
    }

    public init(id: Int?, slug: String?, name: String?, released: String?, tba: Bool?, backgroundImage: String?, rating: Double?, ratingTop: Int?, ratings: [Rating]?, ratingsCount: Int?, reviewsTextCount: Int?, added: Int?, addedByStatus: AddedByStatus?, metacritic: Int?, playtime: Int?, suggestionsCount: Int?, userGame: JSONNull?, reviewsCount: Int?, saturatedColor: ColorRes?, dominantColor: ColorRes?, platforms: [PlatformElement]?, parentPlatforms: [ParentPlatform]?, genres: [Genre]?, stores: [Store]?, clip: Clip?, tags: [Genre]?, shortScreenshots: [ShortScreenshot]?) {
        self.id = id
        self.slug = slug
        self.name = name
        self.released = released
        self.tba = tba
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratings = ratings
        self.ratingsCount = ratingsCount
        self.reviewsTextCount = reviewsTextCount
        self.added = added
        self.addedByStatus = addedByStatus
        self.metacritic = metacritic
        self.playtime = playtime
        self.suggestionsCount = suggestionsCount
        self.userGame = userGame
        self.reviewsCount = reviewsCount
        self.saturatedColor = saturatedColor
        self.dominantColor = dominantColor
        self.platforms = platforms
        self.parentPlatforms = parentPlatforms
        self.genres = genres
        self.stores = stores
        self.clip = clip
        self.tags = tags
        self.shortScreenshots = shortScreenshots
    }
}
