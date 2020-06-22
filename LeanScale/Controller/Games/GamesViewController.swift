//
//  GamesViewController.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/19/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var networkManager = NetworkManager()
    var games: [GamesResult] = []
    var page = 1
    var isLoadingTableView = true
    let showDetailIdentifire = "showDetail"
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
        getGames()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showDetailIdentifire {
            let viewController: GameTableViewController = segue.destination as! GameTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            viewController.id = self.games[(indexPath?.row)!].id
        }
    }
    
    // MARK: - API Method
    
    func getGames() {
        runActivityIndicator()
        networkManager.getGameList(pageSize: 15, page: page) { (response, err) in
            guard !(response?.results?.isEmpty ?? false) && self.isLoadingTableView else {
                return
            }
            if let newItems = response?.results, newItems.count > 0 {
                for item in newItems {
                    self.games.append(item)
                }
            }
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.page += 1
                self.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - UITableView Extensions Methode

extension GamesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifire, for: indexPath) as! GameTableViewCell
        cell.config(data: games[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if games.count > 0 && indexPath.row == games.count - 1 && isLoadingTableView { // last cell
            guard indexPath.row > 7 else { return }
            self.getGames()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: showDetailIdentifire, sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136.0
    }
}

// MARK: - UISearchResultsUpdating Method

extension GamesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
