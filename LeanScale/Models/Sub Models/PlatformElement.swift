//
//  PlatformElement.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct PlatformElement: Codable {
    public var platform: PlatformPlatform?
    public var releasedAt: String?
    public var requirementsEn: Requirements?
    public var requirementsRu: Requirements?

    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }

    public init(platform: PlatformPlatform?, releasedAt: String?, requirementsEn: Requirements?, requirementsRu: Requirements?) {
        self.platform = platform
        self.releasedAt = releasedAt
        self.requirementsEn = requirementsEn
        self.requirementsRu = requirementsRu
    }
}
