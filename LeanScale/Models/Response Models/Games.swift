//
//  Games.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Games: Codable {
    public var count: Int?
    public var next: String?
    public var previous: String?
    public var results: [GamesResult]?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }

    public init(count: Int?, next: String?, previous: String?, results: [GamesResult]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results        
    }
}
