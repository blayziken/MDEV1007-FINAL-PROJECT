//
//  RecipeView.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        ScrollView {
            
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image("defaultImage")
                        .resizable()
                    //                    .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                    //                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(height: 300)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                
            
            VStack(spacing: 30) {
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(recipe.ingredients)
                        }
                    }
                    
                    if !recipe.directions.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Directions")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(recipe.directions)
                        }
                    }
                }
                                .frame(width: .infinity, alignment: .leading)
                               
            }
            .padding(.horizontal, 150)
//                            .frame(width: .infinity, alignment: .leading)
                            
            
            Spacer()
                .frame(height: 50)
            
            Button {
                recipesVM.addToFavs(recipe: recipe)
                
            }label: {
                Text("Add to Favourites")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .padding()
                    .frame(width: 250, height: 60)
                    .foregroundColor(Color.white)
                    .background(.green)
                    .cornerRadius(15)
            }
        }
        //            .ignoresSafeArea(.container, edges: .top)
        //            .padding(.horizontal, 30)
        .alert(item: $recipesVM.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}


#Preview {
    RecipeView(recipe: Recipe.all[0])
}
