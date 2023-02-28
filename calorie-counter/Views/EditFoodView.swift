//
//  EditFoodView.swift
//  calorie-counter
//
//  Created by David Venegas on 2/28/23.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss

    var food: FetchedResults<FoodEntity>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    

    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                    }
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                HStack {
                    Spacer()
                    Button("Update") {
                        DataController().editFood(name: name, calories: calories, food: food, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}
