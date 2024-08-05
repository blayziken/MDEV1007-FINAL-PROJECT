//
//  RecipeViewModel.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published private(set) var favRecipes: [Recipe] = []
    
    @Published var alertItem: AlertItem?
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func addToFavs(recipe: Recipe) {
        favRecipes.append(recipe)
        self.alertItem = AlertContext.favRecipeSaveSuccess
    }
}
