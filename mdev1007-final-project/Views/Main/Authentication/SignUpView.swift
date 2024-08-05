//
//  SignUp.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var pulse = false

    @ObservedObject var authViewModel: AuthViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
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
                    .frame( width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    
                    Text("Sign Up!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Text("Please fill the form below to sign up now.")
                        .font(.subheadline)
                        .opacity(0.8)
                        .padding(.bottom)
                    
//                    TextField(
//                        "Name",
//                        text: $authViewModel.fullName
//                    )
//
//                    .frame(maxWidth: .infinity, maxHeight: 60)
//                    .padding(.horizontal, 15)
//                    .background(.green.opacity(0.1))
//                    .cornerRadius(15)
//                    .autocapitalization(.none)
//                    .disableAutocorrection(true)
//                    .padding(.top, 20)
//                    .multilineTextAlignment(.leading)
                    
                    TextField(
                        "Email",
                        text: $authViewModel.email
                    )
                    
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .padding(.horizontal, 15)
                    .background(.green.opacity(0.1))
                    .cornerRadius(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.leading)
                    
                    SecureField(
                        "Password",
                        text: $authViewModel.password
                    )
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .padding(.horizontal, 15)
                    .background(.green.opacity(0.1))
                    .cornerRadius(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.leading)
                    
                }
                
                Spacer()
                    .frame( width: 50, height: 50)
                
                Button(
                    action: authViewModel.signUp,
                    label: {
                        Text("Sign Up")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 57)
                            .foregroundColor(Color.white)
                            .background(.green)
                            .cornerRadius(15)
                    }
                )
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    VStack {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.all, 20)
                            .background(.green)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                        
                        Text("Back to Login")
                            .font(.headline)
                            .opacity(0.8)
                            .padding(.bottom)
                            .tint(.black)
                    }
                }
                
                NavigationLink(destination: HomeView(), isActive: $authViewModel.navigateToNextScreenFromSignUp) {
                    EmptyView()
                }
            }
            .padding(15)
            .alert(item: $authViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear()
    }
}

#Preview {
    SignUpView()
}
