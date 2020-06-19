//
//  Rating.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Rating: Codable {
    public var id: Int?
    public var title: Title?
    public var count: Int?
    public var percent: Double?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case count = "count"
        case percent = "percent"
    }

    public init(id: Int?, title: Title?, count: Int?, percent: Double?) {
        self.id = id
        self.title = title
        self.count = count
        self.percent = percent
    }
}
