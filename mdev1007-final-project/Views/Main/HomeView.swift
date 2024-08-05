//
//  HomeView.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var networkHandler: NetworkHandler
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Recent additions
                RecipeList(
                    recipes: networkHandler.recipesAll,
                    title: "New"
                )
                
                Spacer()
                    .frame(height: 70)
                
                // Recommended Recipes
                RecipeList(
                    recipes: recipesVM.recipes,
                    title: "Recommended"
                )
            }
//            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
        .environmentObject(RecipesViewModel())
        .environmentObject(NetworkHandler())
}
