//
//  DataController.swift
//  calorie-counter
//
//  Created by David Venegas on 2/28/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load. \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully")
        } catch {
            print("There was an error saving the data")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let food = FoodEntity(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }

    func editFood(name: String, calories: Double, food: FoodEntity, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calories = calories

        save(context: context)
    }
}
