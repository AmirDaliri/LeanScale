//
//  Clips.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Clips: Codable {
    public var the320: String?
    public var the640: String?
    public var full: String?

    enum CodingKeys: String, CodingKey {
        case the320 = "320"
        case the640 = "640"
        case full = "full"
    }

    public init(the320: String?, the640: String?, full: String?) {
        self.the320 = the320
        self.the640 = the640
        self.full = full
    }
}
