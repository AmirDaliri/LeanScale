//
//  GameTableViewController.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit
import CoreData

protocol GameTableDelegate: class {
    func gameSaw(indexPath: IndexPath)
}

class GameTableViewController: UITableViewController {
    
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var gameDescLabel: UILabel!
    
    weak var delegate: GameTableDelegate?
    private var networkManager = NetworkManager()
    
    var controller : NSFetchedResultsController<SGame>!
    var gamesSeenController : NSFetchedResultsController<GamesSeen>!
    var gameIndexPatch: IndexPath!
    
    var faveGame: SGame?
    var detail: Game?
    var id: Int?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
        tableView.tableFooterView = UIView()
        attemptFetch()
        
        if faveGame != nil {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
            self.loadFaveGame()
        } else {
            getGameDetail()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.1) {
            self.navigationItem.largeTitleDisplayMode = .never
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.gameSaw(indexPath: gameIndexPatch)
    }
    
    // MARK: - Setup UI From Fave Game
    
    func loadFaveGame() {
        if let data = faveGame {
            gameNameLabel.text = data.name
            gameDescLabel.set(html: data.descValue ?? "")
            DispatchQueue.main.async {
                if let img = data.img {
                    self.coverImageView.image = UIImage(data: img)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Action Method
    
    @IBAction func faveBarButtonTapped(_ sender: Any) {
        addToFavorite()
    }
    
    
    // MARK: - coreData Method
    
    func addToFavorite() {
        var genresArr = [String]()
        
        let game = SGame(context: context)
        let imageData = self.coverImageView.image?.pngData()
        let id = Int32((detail?.id)!)
        
        if let genres = detail?.genres {
            for genre in genres {
                genresArr.append(genre.name ?? "")
            }
        }
        
        game.name = detail?.name ?? Strings.noName
        game.descValue = detail?.gameDescription ?? Strings.noDescription
        game.reddit = detail?.redditurl
        game.url = detail?.website
        game.metacritic = Int32(detail?.metacritic ?? 0)
        game.img = imageData
        game.id = id
        game.genres = genresArr.joined(separator: ", ")
        
        appDelegate.saveContext()
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "icons8-ok")        
    }
    
    // MARK: - API Method
    
    func getGameDetail() {
        guard let gameID = id else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        runActivityIndicator()
        networkManager.getGame(id: gameID) { (response, error) in
            DispatchQueue.main.async {
                if let game = response {
                    UIView.animate(withDuration: 0.4) {
                        self.detail = game
                        self.gameDescLabel.set(html: game.gameDescription ?? Strings.noDescription)
                        if let imgLink = game.backgroundImage {
                            self.networkManager.getImage(url: imgLink, imageView: self.coverImageView, shouldResize: false)
                        }
                        self.gameNameLabel.text = game.name ?? Strings.noName
                        
                        self.view.layoutIfNeeded()
                        self.tableView.beginUpdates()
                        self.tableView.endUpdates()
                    }
                }
                self.stopActivityIndicator()
                guard let id = response?.id else {return}
                self.addSeenGamesId(id: Int32(id))
            }
        }
    }
    //MARK: - coreData
    
    func attemptFetch() {
        
        let fetchRequest :NSFetchRequest<SGame> = SGame.fetchRequest()
        
        let datasort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [datasort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.controller = controller
        
        do{
            try controller.performFetch()
        }
        catch{
            let error = error as NSError
            print(error.debugDescription)
        }
        
        if let items = controller.fetchedObjects {
            for i in items {
                if id == Int(i.id) {
                    self.navigationItem.rightBarButtonItem?.isEnabled = false
                    self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
                }
            }
        }
    }
    
    /**
        Games Seen IDS

        - SeeAlso: get all game ids that user saw detail view from data base

        - Version: 1.0

        - Author: amir daliri

        - Note: checking id if is not existed append to database
    **/
        
        func fetchGamesSeenIds() -> [Int] {
            
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
            
            var ids: [Int] = []
            if let items = controller.fetchedObjects {
                for i in items {
                    ids.append(Int(i.id))
                }
            }
            
            return ids
        }
        
        func addSeenGamesId(id: Int32) {
            let game = GamesSeen(context: context)
            for i in fetchGamesSeenIds() {
                if i == id {
                    return
                }
            }
            game.id = id
            appDelegate.saveContext()
        }
    
    
    // MARK: - UITableView Methode
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 291
        default:
            return UITableView.automaticDimension
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            if let data = faveGame, let urlStr = data.reddit, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            } else if let urlStr = detail?.redditurl, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            } else {
                self.showAlert(title: "Ops!", message: Strings.noReddit, buttonTitle: "ok")
            }
        case 3:
            if let data = faveGame, let urlStr = data.url, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            } else if let urlStr = detail?.website, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            } else {
                self.showAlert(title: "Ops!", message: Strings.noUrl, buttonTitle: "ok")
            }
        default:
            break
        }
    }
}
