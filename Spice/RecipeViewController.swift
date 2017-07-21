//
//  RecipeViewController.swift
//
//
//  Created by Alick C Zhang on 7/20/17.
//
//

import UIKit

class RecipeViewController: UIViewController {
    
    //links VC to code
    @IBOutlet weak var displayRecipe: UITextView!
    
    @IBOutlet weak var recipeNameTextField: UILabel!
    @IBOutlet weak var calorieAmountTextField: UILabel!
    @IBOutlet weak var proteinAmountTextField: UILabel!
    @IBOutlet weak var fatAmountTextField: UILabel!
    @IBOutlet weak var carbAmountTextField: UILabel!
    @IBOutlet weak var healthLabelTextField: UILabel!
    @IBOutlet weak var dietLabelTextField: UILabel!
    @IBOutlet weak var ingredientLineTextField: UILabel!
    
    var allRecipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        if let item = allRecipe {
            print("recipe found")
            recipeNameTextField.text = item.name
            calorieAmountTextField.text = item.calories
            proteinAmountTextField.text = item.protein + " g"
            fatAmountTextField.text = item.fat + " g"
            carbAmountTextField.text = item.carb + " g"
            
            
            let healthLabels = item.healthLabel as! [String]
            healthLabelTextField.text = healthLabels.joined(separator: ", ")
            
            // dietLabelTextField.text = item.dietLabel.
            // ingredientLineTextField.text = item.ingredientLines
            
        } else {
            displayRecipe.text = ""
        }
    }
    
}

