//
//  CoreDataHelper.swift
//  TheMovieProject
//
//  Created by Richard Frank on 21/02/17.
//  Copyright © 2017 Richard Frank. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum CoreDataAction {
    
    case save
    case delete
}

class CoreDataHelper {
    
    static var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    class func createRequestFetchControllerListEntity(sortKey: String, predicateFormat: String?, predicateArgsArray: [Any]?) -> NSFetchRequest<ListEntity> {
        
        let request: NSFetchRequest<ListEntity> = ListEntity.fetchRequest()
        let sort = NSSortDescriptor(key: sortKey, ascending: true)
        request.sortDescriptors = [sort]

        if let predicateFormat = predicateFormat, let predicateArgsArray = predicateArgsArray {
            
            let predicate = NSPredicate(format: predicateFormat, argumentArray: predicateArgsArray)
            request.predicate = predicate
        }

        return request
    }
    
    class func performListEntity(action: CoreDataAction, object: NSManagedObject?) {
        
        switch action {
            
        case .save:
            
            do {
                try self.context.save()
            } catch {
                print("Problems with Context Action (Save) \(error)")
            }
            
        case .delete:
            
            guard let object = object else { return }
            
            context.delete(object)
            
            do {
                try self.context.save()
            } catch {
                print("Problems with Context Action (Delete) \(error)")
            }
            
        }
    }
}
