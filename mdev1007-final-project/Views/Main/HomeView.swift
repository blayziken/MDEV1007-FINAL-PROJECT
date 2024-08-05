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
    
    @State private var bounce = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                Spacer()
                    .frame(height: 20)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("What are you cooking today?")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 10)
                        
                        Image("chef2")
                            .resizable()
                            .frame( width: 100, height: 90)
                            .offset(y: bounce ? -10 : 0)
                            .animation(
                                Animation.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)
                                    .repeatForever(autoreverses: true),
                                value: bounce
                            )
                            .onAppear {
                                bounce.toggle()
                            }
                            .padding(.horizontal, 10)
                        
                    }
                }
                
                Spacer()
                    .frame(height: 10)
                
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
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
        .environmentObject(RecipesViewModel())
        .environmentObject(NetworkHandler())
}
