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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
                .environmentObject(networkHandler)
                .onAppear(){
                    // Alert to ask for notification permission
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("Notification Permission has been given")
                        } else if let error = error {
                            print("Permission not given")
                            print(error.localizedDescription)
                        }
                    }
                }
        }
    }
}
