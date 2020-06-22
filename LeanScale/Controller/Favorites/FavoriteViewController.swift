//
//  FavoriteViewController.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/21/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var controller : NSFetchedResultsController<SGame>!
    let showDetailIdentifire = "showDetail"

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
        attemptFetch()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showDetailIdentifire {
            let vc: GameTableViewController = segue.destination as! GameTableViewController
            if let item = sender as? SGame {                                
                vc.faveGame = item
            }
        }
    }
    
    func configureCell(cell : GameTableViewCell , indexPath: NSIndexPath) {
        let item  = controller.object(at:indexPath as IndexPath)
        cell.configFave(data: item)
     }
    
    //MARK: - coreData
    
    func attemptFetch() {
        
        let fetchRequest :NSFetchRequest<SGame> = SGame.fetchRequest()
        
        let datasort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [datasort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        self.controller = controller

        do{
           try controller.performFetch()
        }
        catch{
            let error = error as NSError
            print(error.debugDescription)
        }
        
        if controller.fetchedObjects?.isEmpty ?? false {
            TableViewHelper.EmptyMessage(message: "There is no favourites found.", viewController: self, tableView: tableView)
            self.title = "Favourites"
        } else {
            self.title = "Favourites (\(controller.fetchedObjects?.count ?? 0))"
        }
    }
}

// MARK: - UITableView Extensions Methode

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionsInfo = sections[section]
            return sectionsInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifire, for: indexPath) as! GameTableViewCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = controller.fetchedObjects, obj.count > 0 {
            let item = obj[indexPath.row]
            self.performSegue(withIdentifier: showDetailIdentifire, sender: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (contextualAction, view, boolValue) in
            let item  = self.controller.object(at:indexPath as IndexPath)
            view.tintColor = .red
            boolValue(true)
            context.delete(item)
            appDelegate.saveContext()
            self.attemptFetch()
        }
        deleteAction.backgroundColor = .systemRed
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActions
    }
}



extension FavoriteViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            tableView.beginUpdates()
        }
        
        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            tableView.endUpdates()
        }
        
        func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
            
            switch (type) {
            case .insert:
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                    tableView.backgroundView = nil
                    attemptFetch()
                }
                break
                
            case .delete:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                break
                
            case.update:
                if let indexPath = indexPath {
                    let cell = tableView.cellForRow(at: indexPath) as! GameTableViewCell
                    configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
                }
                break
                
            case .move:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
                
            @unknown default:
                fatalError()
            }
            
        }
}
