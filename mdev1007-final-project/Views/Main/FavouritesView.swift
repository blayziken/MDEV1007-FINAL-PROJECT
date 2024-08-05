//
//  FavouritesView.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                if(recipesVM.favRecipes.isEmpty) {
                    Text("You haven't saved any recipe to your favorites yet.")
                        .padding(.top, 150)
                        .padding()
                } else {
                    RecipeList(
                        recipes: recipesVM.favRecipes,
                        title: ""
                    )
                }
                
            }
            .navigationTitle("Favorites")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    FavouritesView()
}
