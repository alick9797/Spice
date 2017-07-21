//
//  Recipe.swift
//  Spice
//
//  Created by Alick C Zhang on 7/17/17.
//  Copyright © 2017 Alick C Zhang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Recipe {
    let name: String
    let image: String
    let calories: String
    let caloriesUnit: String
    let fat: String
    let fatUnit: String
    let protein: String
    let proteinUnit: String
    let carb: String
    let carbUnit: String
    let dietLabel: Array<Any>
    let healthLabel: Array<Any>
    let ingredientLines: Array<Any>
//    let ingredients: Double
//    let usedIngredients: Double
//    let missedIngredients: Double
//    let image: String
    
    init(json: JSON) {

        self.name = json["recipe"]["label"].stringValue
        self.image = json["recipe"]["image"].stringValue
        self.calories = json["recipe"]["totalNutrients"]["ENERC_KCAL"]["quantity"].stringValue
        self.caloriesUnit = json["recipe"]["totalNutrients"]["ENERC_KCAL"]["unit"].stringValue
        self.fat = json["recipe"]["totalNutrients"]["FAT"]["quantity"].stringValue
        self.fatUnit = json["recipe"]["totalNutrients"]["FAT"]["unit"].stringValue
        self.protein = json["recipe"]["totalNutrients"]["PROCNT"]["quantity"].stringValue
        self.proteinUnit = json["recipe"]["totalNutrients"]["PROCNT"]["unit"].stringValue
        self.carb = json["recipe"]["totalNutrients"]["CHOCDF"]["quantity"].stringValue
        self.carbUnit = json["recipe"]["totalNutrients"]["CHOCDF"]["unit"].stringValue
        self.dietLabel = json["recipe"]["dietLabels"].arrayValue
        self.healthLabel = json["recipe"]["healthLabels"].arrayValue
        self.ingredientLines = json["recipe"]["ingredientLines"].arrayValue
        
//        self.usedIngredients = json["usedIngredientCount"].doubleValue
//        self.missedIngredients = json["missedIngredientCount"].doubleValue
//        self.image = json["image"].stringValue
        
    }
}
