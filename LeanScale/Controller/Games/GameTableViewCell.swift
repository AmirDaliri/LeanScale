//
//  GameTableViewCell.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit
import CoreData

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    @IBOutlet private weak var gameTypeLabel: UILabel!
    
    var networkManager = NetworkManager()
    var gamesSeenController : NSFetchedResultsController<GamesSeen>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameImageView.layer.cornerRadius = 8.0
        gameImageView.layer.masksToBounds = true
    }
    
    // MARK: - Config From API
    func config(data: GamesResult) {
        
        fetchGamesSeenIds(id: Int32(data.id!))
        
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
    
    // MARK: - TODO Method
    
/**
    ToDo Feature

    - Parameter id: Game ID

    - Todo: change background color if game detail was seen.

    - Version: 1.0

    - Author: amir daliri

    - Note: if user checked the game detail view, id added to data base and call in this method.
**/
    
    func fetchGamesSeenIds(id: Int32) {
        
        let fetchRequest :NSFetchRequest<GamesSeen> = GamesSeen.fetchRequest()
        
        let datasort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [datasort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.gamesSeenController = controller
        
        do{
            try controller.performFetch()
        }
        catch{
            let error = error as NSError
            print(error.debugDescription)
        }
        
        if let items = controller.fetchedObjects {
            for i in items {
                if i.id == id {
                    DispatchQueue.main.async {
                        self.backgroundColor = UIColor(named: "cellUnselectBackground")!
                    }
                } else {
                    self.backgroundColor = UIColor(named: "cellSelectBackground")!
                }
            }
        }
    }
    
}

// MARK: - Cell Identifire

extension GameTableViewCell {
    static let identifire = "gameTableCell"
}
