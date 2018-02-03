//
//  DataManager.swift
//  ProductCatalogue
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    var context : NSManagedObjectContext?
    
    override init() {
        super.init()
        self.context = getCDContext()
    }
    
    func getCDContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        context.mergePolicy = NSOverwriteMergePolicy
        return context
    }
    
    func saveSearchResultsToCD(searchResult: ProductSearch, withCompletionHandler completionHandler : ()->(), andErrorHandler errorHandler:()->()) {
        if let currentContext = context{
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ProductSearchEntity")
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let searchResultCDList = try currentContext.fetch(fetchRequest)
                if(searchResultCDList.count > 0){
                    //Update existing entity
                    let searchResultCD : NSManagedObject = searchResultCDList.last!
                    searchResultCD.setValue(searchResult.status, forKey: "status")
                    searchResultCD.setValue(searchResult.data, forKey: "data")
                    searchResultCD.setValue(searchResult.header, forKey: "header")
                    do{
                        try currentContext.save()
                        completionHandler()
                    }catch{
                        errorHandler()
                    }
                }else{
                    // Insert new entity
                    let searchResultEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductSearchEntity", into: currentContext)
                    searchResultEntity.setValue(searchResult.status, forKey: "status")
                    searchResultEntity.setValue(searchResult.data, forKey: "data")
                    searchResultEntity.setValue(searchResult.header, forKey: "header")
                    do{
                        try currentContext.save()
                        completionHandler()
                    }catch{
                        errorHandler()
                    }
                }
            } catch {
                //Insert new entity
                let searchResultEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductSearchEntity", into: currentContext)
                searchResultEntity.setValue(searchResult.status, forKey: "status")
                searchResultEntity.setValue(searchResult.data, forKey: "data")
                searchResultEntity.setValue(searchResult.header, forKey: "header")
                do{
                    try currentContext.save()
                    completionHandler()
                }catch{
                    errorHandler()
                }
            }
        }else{
            errorHandler()
        }
    }
    
    func loadSearchResultsFromCD() -> ProductSearch? {
        var searchResultCD : NSManagedObject? = nil
        var searchResult : ProductSearch?
        if let currentContext = context{
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ProductSearchEntity")
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let searchResultCDList = try currentContext.fetch(fetchRequest)
                if(searchResultCDList.count > 0){
                    searchResultCD = searchResultCDList.last
                    searchResult = ProductSearch.init(status: searchResultCD?.value(forKey: "status") as? Status, data: searchResultCD?.value(forKey: "data") as? [ProductData], header: searchResultCD?.value(forKey: "header") as? Header)
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        return searchResult
    }

}
