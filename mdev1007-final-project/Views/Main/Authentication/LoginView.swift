//
//  Login.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var pulse = false
    
    @ObservedObject var authViewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame( height: 30)
                
                Image("recipeLogo")
                    .resizable()
                    .frame( width: 250, height: 220)
                    .foregroundColor(.green.opacity(0.8))
                    .scaleEffect(pulse ? 1.2 : 1.0)
//                    .opacity(pulse ? 0.6 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 1).repeatForever(autoreverses: true),
                        value: pulse
                    )
                    .onAppear {
                        pulse.toggle()
                    }
                
                Spacer()
                    .frame(height: 30)
                
                VStack {
                    
                    Text("Welcome!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Text("Enter your username and password")
                        .font(.subheadline)
                        .opacity(0.8)
                        .padding(.bottom)
                    
                    
                    TextField(
                        "Email",
                        text: $authViewModel.email
                    )
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 65)
                    .background(.green.opacity(0.1))
                    .cornerRadius(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    .multilineTextAlignment(.leading)
                    
                    SecureField(
                        "Password",
                        text: $authViewModel.password
                    )
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 65)
                    .background(.green.opacity(0.1))
                    .cornerRadius(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.leading)
                    
                }
                
                Spacer()
                    .frame( width: 50, height: 50)
                
                Button(
                    action: authViewModel.login,
                    label: {
                        Text("Login")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 57)
                            .foregroundColor(Color.white)
                            .background(.green)
                            .cornerRadius(15)
                    }
                )
                
                Spacer()
                    .frame( height: 10)
                
                NavigationLink(destination: SignUpView()) {
                    Text("Already have an account? Sign up now.")
                        .font(.subheadline)
                        .tint(.black)
                        .italic()
                        .opacity(0.8)
                }
                
                NavigationLink(destination: HomeView(), isActive: $authViewModel.navigateToNextScreenFromLogin) {
                    EmptyView()
                }
                
                Spacer()
                
                
            }
            .multilineTextAlignment(.center)
            .padding(15)
            .alert(item: $authViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
