//
//  Clip.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Clip: Codable {
    public var clip: String?
    public var clips: Clips?
    public var video: String?
    public var preview: String?

    enum CodingKeys: String, CodingKey {
        case clip = "clip"
        case clips = "clips"
        case video = "video"
        case preview = "preview"
    }

    public init(clip: String?, clips: Clips?, video: String?, preview: String?) {
        self.clip = clip
        self.clips = clips
        self.video = video
        self.preview = preview
    }
}
