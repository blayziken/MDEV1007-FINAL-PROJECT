//
//  AA.swift
//  mdev1007-final-project
//
//  Created by Blaze on 05/08/2024.
//

import SwiftUI

struct AA: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 30) {
                    Text("recipe.name")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                            Text("This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation.")
                        
                        
                        
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Ingredients")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("¼ cup cashews\n1 medium onion, cut into ½-inch dice (2 cups)\n1½ pounds carrots, cut into ½-inch dice (3½ cups)\n1 red bell pepper, peeled and cut into ½-inch dice (1 cup)\n1 sprig fresh rosemary\n1 sprig fresh thyme\n1 large fresh sage leaf\n4 cloves garlic, minced\n1 tablespoon lemon juice\nSea salt and freshly ground black pepper or cayenne pepper, to taste\n½ cup fresh pomegranate seeds\n2 tablespoons finely chopped fresh parsley")
                            
                        }
                        
                       
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Directions")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("In a small bowl, cover the cashews with ½ cup hot water; let soak 20 minutes. Transfer cashews and remaining liquid to a blender; blend until smooth and creamy. Set aside.\nIn a saucepan, combine onion, carrots, bell pepper, rosemary, thyme, sage, and garlic. Add ½ cup water and sauté over medium heat for 15 to 20 minutes, or until carrots are tender.\nRemove pan from heat. Let vegetables cool for 10 minutes; then remove rosemary sprigs and thyme leaf.\nTransfer sauteed vegetables to a blender, and puree to a smooth paste. Return pureed vegetables to saucepan and add 3 cups water and 1 tablespoon lemon juice. Season with salt and pepper. Bring soup to boiling.\nTo serve, place soup in individual bowls, drizzle with cashew cream, and garnish with pomegranate seeds and parsley.")
                            
                        }
                    }
                    //                .frame(width: .infinity, alignment: .leading)
                }
                //            .background(.blue)
                .frame(width: .infinity, alignment: .leading)
                .background(.yellow)
                //            .padding(.horizontal, 80)
                
            }
        }
    }
}

#Preview {
    AA()
}
