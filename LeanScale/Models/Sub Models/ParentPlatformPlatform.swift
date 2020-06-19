//
//  ParentPlatformPlatform.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct ParentPlatformPlatform: Codable {
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
