//
//  ContentView.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            // Go to Home Page
            TabBar()
            
        } else {
            // Go to Login View
            LoginView()
                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
