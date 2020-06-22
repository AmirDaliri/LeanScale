//
//  ClassModel.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/21/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation

public class SGameObject: NSObject, NSCoding {
    
    public var gameName: String!
    public var gameDescription: String!
    public var gameRedditURL: String!
    public var gameWebURL: String!
    public var gameImg: Data!
    
    enum Key:String {
        case gameName = "name"
        case gameDescription = "descValue"
        case gameRedditURL = "reddit"
        case gameWebURL = "url"
        case gameImg = "image"

    }
    
    init(name: String, desc: String, reddit: String, web: String, img: Data) {
        self.gameName = name
        self.gameDescription = desc
        self.gameRedditURL = reddit
        self.gameWebURL = web
        self.gameImg = img
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(gameName, forKey: Key.gameName.rawValue)
        aCoder.encode(gameDescription, forKey: Key.gameDescription.rawValue)
        aCoder.encode(gameRedditURL, forKey: Key.gameRedditURL.rawValue)
        aCoder.encode(gameWebURL, forKey: Key.gameWebURL.rawValue)
        aCoder.encode(gameImg, forKey: Key.gameImg.rawValue)

    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let gameName = aDecoder.decodeObject(forKey: Key.gameName.rawValue) as! String
        let gameDescription = aDecoder.decodeObject(forKey: Key.gameDescription.rawValue) as! String
        let gameRedditURL = aDecoder.decodeObject(forKey: Key.gameRedditURL.rawValue) as! String
        let gameWebURL = aDecoder.decodeObject(forKey: Key.gameWebURL.rawValue) as! String
        let gameImg = aDecoder.decodeObject(forKey: Key.gameImg.rawValue) as! Data
        self.init(name: gameName, desc: gameDescription, reddit: gameRedditURL, web: gameWebURL, img: gameImg)
    }
}
