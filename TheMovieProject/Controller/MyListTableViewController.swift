//
//  MyListTableViewController.swift
//  TheMovieProject
//
//  Created by Richard Frank on 05/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import UIKit
import CoreData

class MyListTableViewController: UITableViewController {
    
    var controllerListEntity = NSFetchedResultsController<ListEntity>() {
        didSet {
            controllerListEntity.delegate = self
        }
    }
    
    @IBAction func addNewList(_ sender: UIBarButtonItem) {
        
        let alertNewList = UIAlertController(title: "New List", message: "Enter a name for this list", preferredStyle: UIAlertControllerStyle.alert)
        alertNewList.addTextField(configurationHandler: nil)

        let actionAddNewList = UIAlertAction(title: "Save", style: .default) { (action) in
            
            let text = ((alertNewList.textFields?.first)! as UITextField).text
            
            let myEntity = ListEntity(context: CoreDataHelper.context)
            myEntity.leName = text
            myEntity.leUserType = true
            
            CoreDataHelper.performListEntity(action: .save, object: nil)
        }
        
        let actionCancelNewList = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
        alertNewList.addAction(actionAddNewList)
        alertNewList.addAction(actionCancelNewList)
        
        self.present(alertNewList, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstRun()
        
        let requestListEntity = CoreDataHelper.createRequestFetchControllerListEntity(sortKey: "leUserType", predicateFormat: nil, predicateArgsArray: nil)
        
        controllerListEntity = NSFetchedResultsController(fetchRequest: requestListEntity, managedObjectContext: CoreDataHelper.context, sectionNameKeyPath: "leUserType", cacheName: nil)
        
        do {
            
            try controllerListEntity.performFetch()
            
        } catch {
            
            print("Problems with FetchController \(error)")
        }
    }
    
    private func firstRun() {
        
        if !UserDefaults.standard.bool(forKey: "firstRun?") {
            
            let listEntityOne = ListEntity(context: CoreDataHelper.context)
            listEntityOne.leName = "To Watch"
            listEntityOne.leUserType = false
            
            let listEntityTwo = ListEntity(context: CoreDataHelper.context)
            listEntityTwo.leName = "Watched"
            listEntityTwo.leUserType = false
            
            CoreDataHelper.performListEntity(action: .save, object: nil)

            UserDefaults.standard.set(true, forKey: "firstRun?")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controllerListEntity.sections {
            return sections.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let objects = controllerListEntity.sections?[section].objects {
            return objects.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath)
        
        let object = controllerListEntity.object(at: indexPath)
        
        cell.textLabel?.text = object.leName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
            
        case .delete:
            
            let object = controllerListEntity.object(at: indexPath)
            CoreDataHelper.performListEntity(action: .delete, object: object)
            
        default:
            
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if (indexPath.row == 0 && indexPath.section == 0) ||
            (indexPath.row == 1 && indexPath.section == 0) {
            return false
        } else {
            return true
        }
        
    }
}


// Extension NSFetchedResultsControllerDelegate

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
