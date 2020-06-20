//
//  SearchedGames.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

// MARK: - SearchedGames
public struct SearchedGames: Codable {
    public var count: Int?
    public var next: String?
    public var previous: String?
    public var results: [GamesResult]?
    public var userPlatforms: Bool?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
        case userPlatforms = "user_platforms"
    }

    public init(count: Int?, next: String?, previous: String?, results: [GamesResult]?, userPlatforms: Bool?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
        self.userPlatforms = userPlatforms
    }
}

/*
// MARK: - Result
public struct Result: Codable {
    public var slug: String?
    public var name: String?
    public var playtime: Int?
    public var platforms: [Platform]?
    public var stores: [Store]?
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
    public var suggestionsCount: Int?
    public var id: Int?
    public var score: String?
    public var clip: Clip?
    public var tags: [Tag]?
    public var userGame: JSONNull?
    public var reviewsCount: Int?
    public var saturatedColor: ColorRes?
    public var dominantColor: ColorRes?
    public var shortScreenshots: [ShortScreenshot]?
    public var parentPlatforms: [Platform]?
    public var genres: [Genre]?
    public var communityRating: Int?

    enum CodingKeys: String, CodingKey {
        case slug = "slug"
        case name = "name"
        case playtime = "playtime"
        case platforms = "platforms"
        case stores = "stores"
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
        case suggestionsCount = "suggestions_count"
        case id = "id"
        case score = "score"
        case clip = "clip"
        case tags = "tags"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case shortScreenshots = "short_screenshots"
        case parentPlatforms = "parent_platforms"
        case genres = "genres"
        case communityRating = "community_rating"
    }

    public init(slug: String?, name: String?, playtime: Int?, platforms: [Platform]?, stores: [Store]?, released: String?, tba: Bool?, backgroundImage: String?, rating: Double?, ratingTop: Int?, ratings: [Rating]?, ratingsCount: Int?, reviewsTextCount: Int?, added: Int?, addedByStatus: AddedByStatus?, metacritic: Int?, suggestionsCount: Int?, id: Int?, score: String?, clip: Clip?, tags: [Tag]?, userGame: JSONNull?, reviewsCount: Int?, saturatedColor: ColorRes?, dominantColor: ColorRes?, shortScreenshots: [ShortScreenshot]?, parentPlatforms: [Platform]?, genres: [Genre]?, communityRating: Int?) {
        self.slug = slug
        self.name = name
        self.playtime = playtime
        self.platforms = platforms
        self.stores = stores
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
        self.suggestionsCount = suggestionsCount
        self.id = id
        self.score = score
        self.clip = clip
        self.tags = tags
        self.userGame = userGame
        self.reviewsCount = reviewsCount
        self.saturatedColor = saturatedColor
        self.dominantColor = dominantColor
        self.shortScreenshots = shortScreenshots
        self.parentPlatforms = parentPlatforms
        self.genres = genres
        self.communityRating = communityRating
    }
}
*/


// MARK: - Tag
public struct Tag: Codable {
    public var id: Int?
    public var name: String?
    public var slug: String?
    public var language: Language?
    public var gamesCount: Int?
    public var imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case language = "language"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }

    public init(id: Int?, name: String?, slug: String?, language: Language?, gamesCount: Int?, imageBackground: String?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.language = language
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
    }
}

