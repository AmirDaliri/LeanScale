//
//  Games.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let games = try? newJSONDecoder().decode(Games.self, from: jsonData)

import Foundation

public enum Color: String, Codable {
    case the0F0F0F = "0f0f0f"
}

public enum Language: String, Codable {
    case eng = "eng"
    case rus = "rus"
}

public enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}


public struct Games: Codable {
    public var count: Int?
    public var next: String?
    public var previous: String?
    public var results: [GamesResult]?
    public var seoTitle: String?
    public var seoDescription: String?
    public var seoKeywords: String?
    public var seoH1: String?
    public var noindex: Bool?
    public var nofollow: Bool?
    public var gamesDescription: String?
    public var filters: Filters?
    public var nofollowCollections: [String]?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex = "noindex"
        case nofollow = "nofollow"
        case gamesDescription = "description"
        case filters = "filters"
        case nofollowCollections = "nofollow_collections"
    }

    public init(count: Int?, next: String?, previous: String?, results: [GamesResult]?, seoTitle: String?, seoDescription: String?, seoKeywords: String?, seoH1: String?, noindex: Bool?, nofollow: Bool?, gamesDescription: String?, filters: Filters?, nofollowCollections: [String]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
        self.seoTitle = seoTitle
        self.seoDescription = seoDescription
        self.seoKeywords = seoKeywords
        self.seoH1 = seoH1
        self.noindex = noindex
        self.nofollow = nofollow
        self.gamesDescription = gamesDescription
        self.filters = filters
        self.nofollowCollections = nofollowCollections
    }
}
