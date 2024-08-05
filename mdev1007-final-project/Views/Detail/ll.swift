//
//  ll.swift
//  mdev1007-final-project
//
//  Created by Blaze on 05/08/2024.
//

import SwiftUI
import PhotosUI

struct ll: View {
    @State private var avatarImage: UIImage? 
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        PhotosPicker(selection: $photosPickerItem, matching: .images) {
            Image(uiImage: avatarImage ?? UIImage(named: "defaultImage")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 100)
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
    }
}

#Preview {
    ll()
}
