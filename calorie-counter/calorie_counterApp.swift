//
//  calorie_counterApp.swift
//  calorie-counter
//
//  Created by David Venegas on 2/28/23.
//

import SwiftUI

@main
struct calorie_counterApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
