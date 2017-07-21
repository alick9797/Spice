//
//  ViewController.swift
//  Spice
//
//  Created by Alick C Zhang on 7/17/17.
//  Copyright © 2017 Alick C Zhang. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
//import AlamofireImage
//import AlamofireNetworkActivityIndicator


class ViewController: UIViewController, UITableViewDataSource {
    
    var allRecipes: [Recipe] = []
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func callAPI(_ sender: UIBarButtonItem) {
        
        print("button tapped")
    
        let apiToContact = "https://api.edamam.com/search?q=chicken&app_id=6ba79013&app_key=3163d801e443200cfc234ee150e34d4a&from=0&to=3"
        
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                //DispatchQueue.global(qos: .userInitiated).async {
                if let value = response.result.value {

                    let json = JSON(value)
                    
                    let items = json["hits"].arrayValue
             
              
                    for item in items {
                        
                        self.allRecipes.append(Recipe(json: item))
                        
                    }
                    
                    print(self.allRecipes)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                //}
            case .failure(let error):
                print(error)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayRecipe" {
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    let allRecipe = allRecipes[indexPath.row]
                    let displayRecipeViewController = segue.destination as! RecipeViewController
                    print("recipe loaded")
                    displayRecipeViewController.allRecipe = allRecipe
                }
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeTitle", for: indexPath)
        let recipe = allRecipes[indexPath.row]
        
                cell.textLabel?.text = recipe.name
        
        return cell
    }
 //  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //    selectedRecipeTitle = recipeTitle[indexPath.row]
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
