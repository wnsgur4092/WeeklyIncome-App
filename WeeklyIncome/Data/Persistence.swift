//
//  Persistence.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 26/9/2022.
//

import Foundation
import CoreData

struct WagePersistenceController {
    //MARK: - 1. PERSISTENT CONTROLLER
    static let shared = WagePersistenceController()
    
    //MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer
    
    //MARK: - 3. INITIALISATION
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "WeeklyIncomeData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    //MARK: - 4. PREVIEW
    static var preview: WagePersistenceController = {
        let result = WagePersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.totalTime = ""
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()




}
