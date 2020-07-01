//
//  NetworkManager.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import Foundation
import UIKit

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    
    static let environment : NetworkEnvironment = .production
    /// if have a request to need key
    static let APIKey = ""
    
    let router = Router<RawgApi>()
    
    func getGameList(pageSize: Int, page: Int, completion: @escaping (_ games: Games?,_ error: String?)->()){
        router.request(.getGameList(pageSize: pageSize, page: page)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
//                        print(responseData)
//                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(Games.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getGame(id: Int, completion: @escaping (_ games: Game?,_ error: String?)->()){
        router.request(.getGameWithId(id: id)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(Game.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func searchGame(pageSize: Int, page: Int, query: String, completion: @escaping (_ games: SearchedGames?,_ error: String?)->()){
        router.request(.searchGame(pageSize: pageSize, page: page, query: query)) { (data, response, error) in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(SearchedGames.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getImage(url: String, imageView: UIImageView, shouldResize: Bool) {
        
        let url = URL(string: url)
        let screenSize = UIScreen.main.bounds.width
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: (screenSize/3), height: (screenSize/3.5)))
        
        imageView.kf.indicatorType = .activity
        
        if shouldResize {
            imageView.kf.setImage(with: url, placeholder: nil, options: [ .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage, .processor(processor)],progressBlock: nil) { (_, _, _, _) in }
        } else {
            imageView.kf.setImage(with: url, placeholder: nil, options: [ .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage],progressBlock: nil) { (_, _, _, _) in }
        }
    }

    func setImage(from url: String, imageView: UIImageView) {
        guard let imageURL = URL(string: url) else { return }
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            UIView.transition(with: imageView, duration:0.3, options: .transitionCrossDissolve, animations: {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }, completion: nil)
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
