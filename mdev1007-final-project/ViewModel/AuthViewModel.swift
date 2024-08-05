//
//  AuthViewModel.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var alertItem: AlertItem?
    @Published var navigateToNextScreenFromSignUp: Bool = false
    @Published var navigateToNextScreenFromLogin: Bool = false
    
    func login() {
        print("Login function called")
        
        guard !email.isEmpty && !password.isEmpty else {
            print("Email or password is empty")
            self.alertItem = AlertContext.invalidForm
            
            navigateToNextScreenFromLogin = false
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [self] result, error in
            if error != nil {
                print("Login error")
                print(error!.localizedDescription)
//                self.alertItem = AlertContext.invalidLogin
                
                self.alertItem = AlertItem(
                    title: Text("Login Error"),
                    message: Text(error!.localizedDescription),
                    dismissButton: .default(Text("OK")))
            }
            
            navigateToNextScreenFromLogin = true
        }
    }
    
    func signUp() {
        print("SignUp function called")
        
        guard !email.isEmpty && !password.isEmpty else {
            print("Email or password is empty")
            self.alertItem = AlertContext.invalidForm
            
            navigateToNextScreenFromSignUp = false
            return
        }
            
        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
            print("Email - \(email)")
            print("Password - \(password)")
            
            if error != nil {
                print(error!.localizedDescription)
//                self.alertItem = AlertContext.invalidResponse
                
                self.alertItem = AlertItem(
                    title: Text("Sign up Error"),
                    message: Text(error!.localizedDescription),
                    dismissButton: .default(Text("OK")))
            }
            
            navigateToNextScreenFromSignUp = true
        }
    }
}

