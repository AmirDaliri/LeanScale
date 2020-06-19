//
//  ShortScreenshot.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct ShortScreenshot: Codable {
    public var id: Int?
    public var image: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
    }

    public init(id: Int?, image: String?) {
        self.id = id
        self.image = image
    }
}
