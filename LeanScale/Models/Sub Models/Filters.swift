//
//  Filters.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Filters: Codable {
    public var years: [FiltersYear]?

    enum CodingKeys: String, CodingKey {
        case years = "years"
    }

    public init(years: [FiltersYear]?) {
        self.years = years
    }
}
