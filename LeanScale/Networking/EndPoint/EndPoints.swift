//
//  EndPoints.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum RawgApi {
    case getGameList(pageSize:Int, page: Int)
    case getGameWithId(id:Int)
    case searchGame(pageSize:Int, page: Int, query: String)
}

extension RawgApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.rawg.io/api/"
        case .qa: return "https://api.rawg.io/api/"
        case .staging: return "https://api.rawg.io/api/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    var path: String {
        switch self {
        case .getGameList(let pageSize, let page):
            return "games?page_size=\(pageSize)&page=\(page)"
            case .getGameWithId(let id):
                return "games/\(id)"
        case .searchGame(let pageSize, let page, let query):
            return "games?page_size=\(pageSize)&page=\(page)&search=\(query)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        /*
        case .<#reqName#>(let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page":page,
                                                      "api_key":NetworkManager.APIKey])
        */
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


