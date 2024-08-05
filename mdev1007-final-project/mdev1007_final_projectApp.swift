//
//  mdev1007_final_projectApp.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI
import Firebase

@main
struct mdev1007_final_projectApp: App {
    @StateObject var networkHandler = NetworkHandler()
    @StateObject var recipesViewModel = RecipesViewModel()
    
    init () {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
                .environmentObject(networkHandler)
        }
    }
}
