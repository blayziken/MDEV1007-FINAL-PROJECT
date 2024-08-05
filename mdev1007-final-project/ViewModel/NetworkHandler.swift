//
//  NetworkHandler.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import Foundation
import Firebase

class NetworkHandler: ObservableObject {
    @Published var recipesAll: [Recipe] = []
    
    @Published var saveAlertItem: AlertItem?
    
    init() {
        fetchAllRecipes()
    }
    
    // FETCH ALL RECIPES FROM DATABASE
    func fetchAllRecipes() {
        recipesAll.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("recipes")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let ingredients = data["ingredients"] as? String ?? ""
                    let directions = data["directions"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let datePublished = data["datePublished"] as? String ?? ""
                    let url = data["url"] as? String ?? ""
                   
                    
                    let recipe = Recipe(name: name, image: image, description: description, ingredients: ingredients, directions: directions, category: category, datePublished: datePublished, url: url)
                    
                    self.recipesAll.append(recipe)
                }
            }
        }
        
    }
    
    // ADD RECIPE
    func addRecipe(newRecipe: Recipe, completion: @escaping () -> Void) {
        
        let newRecipeData = [
            "name": newRecipe.name,
            "image": newRecipe.image,
            "description": newRecipe.description,
            "ingredients": newRecipe.ingredients,
            "category": newRecipe.category,
            "datePublished": newRecipe.datePublished,
            "directions": newRecipe.directions,
            "url": newRecipe.url
        ]
        
        let db = Firestore.firestore()
        
        // creates firebase document to store new item
        let ref = db.collection("recipes").document()
        
        ref.setData(newRecipeData) { [self] error in
            if let error = error {
                print(error.localizedDescription)
                self.saveAlertItem = AlertContext.recipeSaveError
                return
            }
        }
        
        self.saveAlertItem = AlertContext.recipeSaveSuccess
        
        // Refresh data
        fetchAllRecipes()
        
        completion()
    }
    
}



