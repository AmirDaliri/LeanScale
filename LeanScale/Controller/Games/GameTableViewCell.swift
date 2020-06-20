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
            CashableImage.downloadImage(url: URL(string: imgLink)!) { (img, err) in
                DispatchQueue.main.async {
                    self.gameImageView.image = img
                }
            }
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

}

extension GameTableViewCell {
    static let identifire = "gameTableCell"
}
