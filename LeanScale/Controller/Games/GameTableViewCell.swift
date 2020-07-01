//
//  GameTableViewCell.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    @IBOutlet private weak var gameTypeLabel: UILabel!
    
    var networkManager = NetworkManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gameImageView.layer.cornerRadius = 8.0
        gameImageView.layer.masksToBounds = true
    }
    
    // MARK: - Config From API
    func config(data: GamesResult) {
        
        nameLabel.text = data.name ?? Strings.noName
        metacriticLabel.text = String(data.metacritic ?? 0)
        
        if let imgLink = data.backgroundImage  {
            networkManager.getImage(url: imgLink, imageView: gameImageView, shouldResize: true)
        }
        
        guard let genres = data.genres else {
            self.gameTypeLabel.text = Strings.noGenre
            return
        }
        
        var genresArr = [String]()
        for genre in genres {
            genresArr.append(genre.name ?? "")
        }
        
        self.gameTypeLabel.text = genresArr.joined(separator: ", ")
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
    }
}

extension GameTableViewCell {
    static let identifire = "gameTableCell"
}
