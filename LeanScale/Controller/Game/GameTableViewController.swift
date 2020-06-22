//
//  GameTableViewController.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit
import CoreData

class GameTableViewController: UITableViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameDescLabel: UILabel!
    
    private var networkManager = NetworkManager()
    
    var controller : NSFetchedResultsController<SGame>!

    var faveGame: SGame?
    var detail: Game?
    var id: Int?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
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
    
    // MARK: - Setup UI From Fave Game
    func loadFaveGame() {
        if let data = faveGame {
            gameNameLabel.text = data.name
            gameDescLabel.text = data.descValue
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
        
        game.name = detail?.name
        game.descValue = detail?.gameDescription
        game.reddit = detail?.redditurl
        game.url = detail?.website
        game.metacritic = Int32(detail?.metacritic ?? 0)
        game.img = imageData
        game.id = id
        game.genres = genresArr.joined(separator: ", ")
        
        appDelegate.saveContext()
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "icons8-ok")
        
//        navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
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
                    self.detail = game
                    self.gameDescLabel.set(html: game.gameDescription ?? "")
                    if let imgLink = game.backgroundImage {
                        self.networkManager.getImage(url: imgLink, imageView: self.coverImageView)
                    }
                    self.gameNameLabel.text = game.name
                }
                self.stopActivityIndicator()
                self.tableView.reloadData()
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
            if let data = faveGame, let urlStr = data.url, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            } else if let urlStr = detail?.redditurl, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            }
        case 3:
            if let data = faveGame, let urlStr = data.reddit, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            } else if let urlStr = detail?.website, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }
}
