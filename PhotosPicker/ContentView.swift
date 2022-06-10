//
// Created for PhotosPicker
// by Stewart Lynch on 2022-06-09
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//


import PhotosUI
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ImageModel()
    var body: some View {
        NavigationStack {
            VStack {
                if let image = viewModel.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else {
                    Text("Tap the menubar button to select a photo")
                        .padding()
                }
            }
                .navigationTitle("PhotosPicker")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        PhotosPicker(selection: $viewModel.imageSelection,
                                     matching: .images,
                                     photoLibrary: .shared()) {
                            Image(systemName: "pencil.circle.fill")
                                .imageScale(.large)
                        }
                    }
                }
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


