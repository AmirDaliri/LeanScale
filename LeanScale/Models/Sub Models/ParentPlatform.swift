//
//  ParentPlatform.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct ParentPlatform: Codable {
    public var platform: ParentPlatformPlatform?

    enum CodingKeys: String, CodingKey {
        case platform = "platform"
    }

    public init(platform: ParentPlatformPlatform?) {
        self.platform = platform
    }
}
