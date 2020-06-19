//
//  AddedByStatus.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct AddedByStatus: Codable {
    public var yet: Int?
    public var owned: Int?
    public var beaten: Int?
    public var toplay: Int?
    public var dropped: Int?
    public var playing: Int?

    enum CodingKeys: String, CodingKey {
        case yet = "yet"
        case owned = "owned"
        case beaten = "beaten"
        case toplay = "toplay"
        case dropped = "dropped"
        case playing = "playing"
    }

    public init(yet: Int?, owned: Int?, beaten: Int?, toplay: Int?, dropped: Int?, playing: Int?) {
        self.yet = yet
        self.owned = owned
        self.beaten = beaten
        self.toplay = toplay
        self.dropped = dropped
        self.playing = playing
    }
}
