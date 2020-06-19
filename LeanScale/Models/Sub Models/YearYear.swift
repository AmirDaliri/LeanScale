//
//  YearYear.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct YearYear: Codable {
    public var year: Int?
    public var count: Int?
    public var nofollow: Bool?

    enum CodingKeys: String, CodingKey {
        case year = "year"
        case count = "count"
        case nofollow = "nofollow"
    }

    public init(year: Int?, count: Int?, nofollow: Bool?) {
        self.year = year
        self.count = count
        self.nofollow = nofollow
    }
}
