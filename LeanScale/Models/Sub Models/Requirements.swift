//
//  Requirements.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Requirements: Codable {
    public var minimum: String?
    public var recommended: String?

    enum CodingKeys: String, CodingKey {
        case minimum = "minimum"
        case recommended = "recommended"
    }

    public init(minimum: String?, recommended: String?) {
        self.minimum = minimum
        self.recommended = recommended
    }
}
