//
//  ModelProduct.swift
//  OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI


struct Product: Hashable, Identifiable, Codable {
    let id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating

    struct Rating: Hashable, Codable {
        var rate: Double
        var count: Double
        
        func formattedRate() -> String {
            return String(format: "%.1f", rate)
        }
    }

    func loadImage() -> Image {
        guard let url = URL(string: image),
              let imageData = try? Data(contentsOf: url),
              let uiImage = UIImage(data: imageData) else {
            return Image(systemName: "photo")
        }
        return Image(uiImage: uiImage)
    }
}

/*struct Product: Identifiable {
    let id: Int
    let title:String
    let price: Double
    let description: String
    let category: String
    let image: String
}*/

