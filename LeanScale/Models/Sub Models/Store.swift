//
//  Store.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public struct Store: Codable {
    public var id: Int?
    public var store: Genre?
    public var urlEn: String?
    public var urlRu: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case store = "store"
        case urlEn = "url_en"
        case urlRu = "url_ru"
    }

    public init(id: Int?, store: Genre?, urlEn: String?, urlRu: String?) {
        self.id = id
        self.store = store
        self.urlEn = urlEn
        self.urlRu = urlRu
    }
}
