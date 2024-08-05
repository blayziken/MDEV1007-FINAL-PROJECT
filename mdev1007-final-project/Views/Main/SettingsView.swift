//
//  SettingsView.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("v1.0.0")
                    .navigationTitle("Settings")
                
                Button{
                    try! Auth.auth().signOut()
                }label: {
                    Text("Logout")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 57)
                        .foregroundColor(Color.white)
                        .background(.green)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 60)
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SettingsView()
}
