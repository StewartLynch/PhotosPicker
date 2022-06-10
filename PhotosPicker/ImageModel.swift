//
// Created for PhotosPicker
// by Stewart Lynch on 2022-06-09
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//
    

import SwiftUI
import PhotosUI

@MainActor
class ImageModel: ObservableObject {
    @Published  var image: Image?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws  {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    print("success")
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            fatalError("Image issue")
        }
    }
}
