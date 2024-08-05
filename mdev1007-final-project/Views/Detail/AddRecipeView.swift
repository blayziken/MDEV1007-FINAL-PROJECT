//
//  AddRecipeView.swift
//  mdev1007-final-project
//
//  Created by Blaze on 04/08/2024.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    @EnvironmentObject var networkHandler: NetworkHandler
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe = false
    
    @State private var isLoading = false
    @State private var isCompleted = false
    
    @State private var avatarImage: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                
                PhotosPicker(selection: $photosPickerItem, matching: .images) {
                    Image(uiImage: avatarImage ?? UIImage(named: "noImage")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 150)
                }
                .onChange(of: photosPickerItem) { _, _ in
                    Task {
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                avatarImage = image
                            }
                        }
                        photosPickerItem = nil
                    }
                }
                
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
                
                //                NavigationLink(destination: HomeView(), isActive: $isCompleted) {
                //                    EmptyView()
                //                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem {
                    
                    Button {
                        isLoading = true
                        let now = Date()
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-mm-dd"
                        let datePublished = dateFormatter.string(from: now)
                        
                        networkHandler.addRecipe(newRecipe: Recipe(
                            name: name,
                            image: "",
                            description: description,
                            ingredients: ingredients,
                            directions: directions,
                            category: selectedCategory.rawValue,
                            datePublished: datePublished,
                            url: ""
                        )) {
                            // Completion handler
                            isLoading = false
                            isCompleted = true
                        }
                        
                        // Send Notification
                        let content = UNMutableNotificationContent()
                        
                        content.title = "Success"
                        content.subtitle = "Your recipe has been uploaded chef!"
                        content.sound = UNNotificationSound.default
                        
                        // show notification with a delay of 5 seconds.
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                    
                    
                    // Loader overlay
                    if isLoading {
                        Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                    }
                    
                    
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .alert(item: $networkHandler.saveAlertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

//extension AddRecipeView {
//
//    private func saveRecipe() {
//        let now = Date()
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        let datePublished = dateFormatter.string(from: now)
//        print("Got here 1")
//        networkHandler.addRecipe(newRecipe: Recipe(
//            name: name,
//            image: "",
//            description: description,
//            ingredients: ingredients,
//            directions: directions,
//            category: selectedCategory.rawValue,
//            datePublished: datePublished,
//            url: ""
//        ))
//
//        //        recipesVM.addRecipe(recipe: recipe)
//    }
//}

#Preview {
    AddRecipeView()
}
