//
//  GameTableViewController.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameDescLabel: UILabel!
    
    private var networkManager = NetworkManager()
    
    var detail: Game?
    var id: Int?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.1) {
            self.navigationItem.largeTitleDisplayMode = .never
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getGameDetail()
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
            if let urlStr = detail?.redditurl, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            }
        case 3:
            if let urlStr = detail?.website, let url = URL(string: urlStr) {
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }
}
