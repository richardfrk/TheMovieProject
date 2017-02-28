//
//  MyListTableViewController+Extension.swift
//  TheMovieProject
//
//  Created by Richard Frank on 28/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MyListTableViewController {
    
    func alertNewList(completionHandler:@escaping (String) -> ()) {
        
        let alertNewList = UIAlertController(title: "New List", message: "Enter a name for this list", preferredStyle: UIAlertControllerStyle.alert)
        alertNewList.addTextField(configurationHandler: nil)
        
        let actionAddNewList = UIAlertAction(title: "Save", style: .default) { (action) in
            
            guard let first = alertNewList.textFields?.first else { return }
            
            guard let text = first.text else { return }
            
            completionHandler(text)
            
        }
        
        let actionCancelNewList = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertNewList.addAction(actionAddNewList)
        alertNewList.addAction(actionCancelNewList)
        
        self.present(alertNewList, animated: true, completion: nil)
        
    }
}

extension MyListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default: break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath:
        IndexPath?) {
        
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default: break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }    
}

