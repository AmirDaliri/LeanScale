//
//  FiltersYear.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct FiltersYear: Codable {
    public var from: Int?
    public var to: Int?
    public var filter: String?
    public var decade: Int?
    public var years: [YearYear]?
    public var nofollow: Bool?
    public var count: Int?

    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case filter = "filter"
        case decade = "decade"
        case years = "years"
        case nofollow = "nofollow"
        case count = "count"
    }

    public init(from: Int?, to: Int?, filter: String?, decade: Int?, years: [YearYear]?, nofollow: Bool?, count: Int?) {
        self.from = from
        self.to = to
        self.filter = filter
        self.decade = decade
        self.years = years
        self.nofollow = nofollow
        self.count = count
    }
}
