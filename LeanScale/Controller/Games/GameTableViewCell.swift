//
//  GameTableViewCell.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var gameTypeLabel: UILabel!
    
    var networkManager = NetworkManager()
    
    func config(data: GamesResult) {
        
        if let name = data.name {
            nameLabel.text = name
        }
        
        if let imgLink = data.backgroundImage  {
            networkManager.getImage(url: imgLink, imageView: gameImageView)
        }
        
        if let metacritic = data.metacritic {
            metacriticLabel.text = String(metacritic)
        }
        
        if let genres = data.genres {
            var genresArr = [String]()
            for genre in genres {
                genresArr.append(genre.name ?? "")
            }
            self.gameTypeLabel.text = genresArr.joined(separator: ", ")
        }
    }
    
    // MARK: - Fetch From DB
    func configFave(data: SGame) {
        nameLabel.text = data.name
        gameTypeLabel.text = data.genres
        metacriticLabel.text = "\(data.metacritic)"
        DispatchQueue.main.async {
            if let img = data.img {
                self.gameImageView.image = UIImage(data: img)
            }
        }
//        gameImageView.image = data.toImage?.img as? UIImage
    }
}

extension GameTableViewCell {
    static let identifire = "gameTableCell"
}
