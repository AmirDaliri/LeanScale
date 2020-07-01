//
//  GamesViewController.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/19/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var networkManager = NetworkManager()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var games: [GamesResult] = []
    var searchedGame: [GamesResult] = []
    
    var page = 1
    var pageSize = 15
    var isInSearch = false
    var isLoadingTableView = true
    let showDetailIdentifire = "showDetail"
    
    var enteredQuery = ""
    var searchItemsLoaded = false
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
        getGames()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSearch()
    }
    
    // MARK: - SearchBar Method
    
    private func setupSearch() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search by Name"
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showDetailIdentifire {
            let viewController: GameTableViewController = segue.destination as! GameTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            
            viewController.gameIndexPatch = indexPath
            viewController.delegate = self
            
            if isInSearch {
                viewController.id = self.searchedGame[(indexPath?.row)!].id
            } else {
                viewController.id = self.games[(indexPath?.row)!].id
            }
        }
    }
    
    // MARK: - API Method
    
    func getGames() {
        runActivityIndicator()
        networkManager.getGameList(pageSize: pageSize, page: page) { (response, err) in
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
    
    func getSearchedGame() {
        guard !searchItemsLoaded else { return }
        networkManager.searchGame(pageSize: pageSize, page: page, query: enteredQuery) { (response, error) in
            guard !(response?.results?.isEmpty ?? false) && self.isLoadingTableView else {
                return
            }
            if let newItems = response?.results, newItems.count > 0 {
                for item in newItems {
                    self.searchedGame.append(item)
                }
            } else {
                self.searchItemsLoaded = true
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
        if isInSearch {
            return searchedGame.count
        } else {
            return games.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifire, for: indexPath) as! GameTableViewCell
        
        if isInSearch {
            cell.config(data: searchedGame[indexPath.row])
        } else {
            cell.config(data: games[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isInSearch {
            if searchedGame.count > 0 && indexPath.row == searchedGame.count - 1 && isLoadingTableView { // last cell
                guard indexPath.row > 7 else { return }
                self.getSearchedGame()
            }
        } else {
            if games.count > 0 && indexPath.row == games.count - 1 && isLoadingTableView { // last cell
                guard indexPath.row > 7 else { return }
                self.getGames()
            }
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
        return UITableView.automaticDimension
    }
}

// MARK: - UISearchBarDelegate Method

extension GamesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text, query.count > 2 {
            self.enteredQuery = query
            page = 1
            searchedGame = []
            isInSearch = true
            networkManager.searchGame(pageSize: pageSize, page: page, query: query) { (response, error) in
                guard !(response?.results?.isEmpty ?? false) && self.isLoadingTableView else {
                    return
                }
                if let newItems = response?.results, newItems.count > 0 {
                    for item in newItems {
                        self.searchedGame.append(item)
                    }
                }
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                    self.page += 1
                    self.tableView.reloadData()
                    self.searchController.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchItemsLoaded = false
        isInSearch = false
        page = 1
        games = []
        getGames()
    }
}

// MARK: - GameTableDelegate Method

/**
    Game Detail Call Back Protocol

    - Parameter indexPath: tableview cell indexPath

    - Todo: change cell background color when user saw detail of game and back to main list

    - Version: 1.0

    - Author: amir daliri
**/

extension GamesViewController: GameTableDelegate {
    func gameSaw(indexPath: IndexPath) {
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
}
