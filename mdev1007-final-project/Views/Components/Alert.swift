//
//  Alert.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Network Alerts
    
    static let invalidLogin = AlertItem(
        title: Text("Server Error"),
        message: Text("Data received from Server is invalid, please contact support"),
        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid Response from Server. Please try again later or contact support"),
        dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts
    static let invalidForm      = AlertItem(title: Text("Invalid fields"),
                                            message: Text("Please ensure your email and password have been filled out."),
                                            dismissButton: .default(Text("OK")))

    static let movieSaveSuccess  = AlertItem(title: Text("Recipe Saved"),
                                            message: Text("Recipe was successfully saved."),
                                            dismissButton: .default(Text("OK")))
    
    static let movieSaveError  = AlertItem(title: Text("Error"),
                                            message: Text("Something went wrong, please try again."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData  = AlertItem(title: Text("Error"),
                                            message: Text("There was an error saving this recipe."),
                                            dismissButton: .default(Text("OK")))
    
}


