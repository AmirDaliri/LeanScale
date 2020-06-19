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
    public var slug: String?
    public var name: String?
    public var nameOriginal: String?
    public var gameDescription: String?
    public var metacritic: Int?
    public var metacriticPlatforms: [MetacriticPlatform]?
    public var released: String?
    public var tba: Bool?
    public var updated: String?
    public var backgroundImage: String?
    public var backgroundImageAdditional: String?
    public var website: String?
    public var rating: Double?
    public var ratingTop: Int?
    public var ratings: [Rating]?
    public var reactions: [String: Int]?
    public var added: Int?
    public var addedByStatus: AddedByStatus?
    public var playtime: Int?
    public var screenshotsCount: Int?
    public var moviesCount: Int?
    public var creatorsCount: Int?
    public var achievementsCount: Int?
    public var parentAchievementsCount: Int?
    public var redditurl: String?
    public var redditName: String?
    public var redditDescription: String?
    public var redditLogo: String?
    public var redditCount: Int?
    public var twitchCount: Int?
    public var youtubeCount: Int?
    public var reviewsTextCount: Int?
    public var ratingsCount: Int?
    public var suggestionsCount: Int?
    public var alternativeNames: [String]?
    public var metacriticurl: String?
    public var parentsCount: Int?
    public var additionsCount: Int?
    public var gameSeriesCount: Int?
    public var userGame: JSONNull?
    public var reviewsCount: Int?
    public var saturatedColor: String?
    public var dominantColor: String?
    public var parentPlatforms: [ParentPlatform]?
    public var platforms: [PlatformElement]?
    public var stores: [Store]?
    public var developers: [Developer]?
    public var genres: [Developer]?
    public var tags: [Developer]?
    public var publishers: [Developer]?
    public var esrbRating: EsrbRating?
    public var clip: Clip?
    public var descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case name = "name"
        case nameOriginal = "name_original"
        case gameDescription = "description"
        case metacritic = "metacritic"
        case metacriticPlatforms = "metacritic_platforms"
        case released = "released"
        case tba = "tba"
        case updated = "updated"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website = "website"
        case rating = "rating"
        case ratingTop = "rating_top"
        case ratings = "ratings"
        case reactions = "reactions"
        case added = "added"
        case addedByStatus = "added_by_status"
        case playtime = "playtime"
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditurl = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticurl = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case parentPlatforms = "parent_platforms"
        case platforms = "platforms"
        case stores = "stores"
        case developers = "developers"
        case genres = "genres"
        case tags = "tags"
        case publishers = "publishers"
        case esrbRating = "esrb_rating"
        case clip = "clip"
        case descriptionRaw = "description_raw"
    }

    public init(id: Int?, slug: String?, name: String?, nameOriginal: String?, gameDescription: String?, metacritic: Int?, metacriticPlatforms: [MetacriticPlatform]?, released: String?, tba: Bool?, updated: String?, backgroundImage: String?, backgroundImageAdditional: String?, website: String?, rating: Double?, ratingTop: Int?, ratings: [Rating]?, reactions: [String: Int]?, added: Int?, addedByStatus: AddedByStatus?, playtime: Int?, screenshotsCount: Int?, moviesCount: Int?, creatorsCount: Int?, achievementsCount: Int?, parentAchievementsCount: Int?, redditurl: String?, redditName: String?, redditDescription: String?, redditLogo: String?, redditCount: Int?, twitchCount: Int?, youtubeCount: Int?, reviewsTextCount: Int?, ratingsCount: Int?, suggestionsCount: Int?, alternativeNames: [String]?, metacriticurl: String?, parentsCount: Int?, additionsCount: Int?, gameSeriesCount: Int?, userGame: JSONNull?, reviewsCount: Int?, saturatedColor: String?, dominantColor: String?, parentPlatforms: [ParentPlatform]?, platforms: [PlatformElement]?, stores: [Store]?, developers: [Developer]?, genres: [Developer]?, tags: [Developer]?, publishers: [Developer]?, esrbRating: EsrbRating?, clip: Clip?, descriptionRaw: String?) {
        self.id = id
        self.slug = slug
        self.name = name
        self.nameOriginal = nameOriginal
        self.gameDescription = gameDescription
        self.metacritic = metacritic
        self.metacriticPlatforms = metacriticPlatforms
        self.released = released
        self.tba = tba
        self.updated = updated
        self.backgroundImage = backgroundImage
        self.backgroundImageAdditional = backgroundImageAdditional
        self.website = website
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratings = ratings
        self.reactions = reactions
        self.added = added
        self.addedByStatus = addedByStatus
        self.playtime = playtime
        self.screenshotsCount = screenshotsCount
        self.moviesCount = moviesCount
        self.creatorsCount = creatorsCount
        self.achievementsCount = achievementsCount
        self.parentAchievementsCount = parentAchievementsCount
        self.redditurl = redditurl
        self.redditName = redditName
        self.redditDescription = redditDescription
        self.redditLogo = redditLogo
        self.redditCount = redditCount
        self.twitchCount = twitchCount
        self.youtubeCount = youtubeCount
        self.reviewsTextCount = reviewsTextCount
        self.ratingsCount = ratingsCount
        self.suggestionsCount = suggestionsCount
        self.alternativeNames = alternativeNames
        self.metacriticurl = metacriticurl
        self.parentsCount = parentsCount
        self.additionsCount = additionsCount
        self.gameSeriesCount = gameSeriesCount
        self.userGame = userGame
        self.reviewsCount = reviewsCount
        self.saturatedColor = saturatedColor
        self.dominantColor = dominantColor
        self.parentPlatforms = parentPlatforms
        self.platforms = platforms
        self.stores = stores
        self.developers = developers
        self.genres = genres
        self.tags = tags
        self.publishers = publishers
        self.esrbRating = esrbRating
        self.clip = clip
        self.descriptionRaw = descriptionRaw
    }
}

// MARK: - EsrbRating
public struct EsrbRating: Codable {
    public var id: Int?
    public var name: String?
    public var slug: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
    }

    public init(id: Int?, name: String?, slug: String?) {
        self.id = id
        self.name = name
        self.slug = slug
    }
}

// MARK: - MetacriticPlatform
public struct MetacriticPlatform: Codable {
    public var metascore: Int?
    public var url: String?
    public var platform: MetacriticPlatformPlatform?

    enum CodingKeys: String, CodingKey {
        case metascore = "metascore"
        case url = "url"
        case platform = "platform"
    }

    public init(metascore: Int?, url: String?, platform: MetacriticPlatformPlatform?) {
        self.metascore = metascore
        self.url = url
        self.platform = platform
    }
}

// MARK: - MetacriticPlatformPlatform
public struct MetacriticPlatformPlatform: Codable {
    public var platform: Int?
    public var name: String?
    public var slug: String?

    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        case name = "name"
        case slug = "slug"
    }

    public init(platform: Int?, name: String?, slug: String?) {
        self.platform = platform
        self.name = name
        self.slug = slug
    }
}

// MARK: - Developer
public struct Developer: Codable {
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
