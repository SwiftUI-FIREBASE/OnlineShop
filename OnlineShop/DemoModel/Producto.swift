import SwiftUI

import Foundation
import FirebaseFirestore


struct ProductDemo: Identifiable, Codable {
    let id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating

    struct Rating: Codable {
        var rate: Double
        
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

struct Order: Codable{
    @DocumentID var identify:String?
    var products: [Product]=[MockData.sampleProduct1,MockData.sampleProduct3]
}


struct MockData{

    //static let rating = Rating(rate: 3.9, count: 120)

    static let sampleProduct1 = ProductDemo(id: 0001,
                                     title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                     price: 109.95,
                                     description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                     category: "men's clothing",
                                     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                            rating: ProductDemo.Rating(rate: 4.9)
                                     )

    static let sampleProduct2 = ProductDemo(id: 0002,
                                     title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                     price: 109.95,
                                     description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                     category: "men's clothing",
                                     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                            rating: ProductDemo.Rating(rate: 4.9)
                                     )

    static let sampleProduct3 = ProductDemo(id: 0003,
                                     title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                     price: 109.95,
                                     description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                     category: "men's clothing",
                                     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                            rating: ProductDemo.Rating(rate: 4.9)
                                     )

    static let products = [sampleProduct1, sampleProduct2, sampleProduct3]

}

/**
 
 struct ProductDemo: Identifiable, Codable{
     let id: Int
     var title:String
     var price: Double
     var description: String
     var category: String
     var image: String
     
 }

 struct Order:Codable{
     @DocumentID var identify:String?
     var products: [ProductDemo]=[MockData.sampleProduct1,MockData.sampleProduct3]
 }


 struct MockData{

     //static let rating = Rating(rate: 3.9, count: 120)

     static let sampleProduct1 = ProductDemo(id: 0001,
                                      title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                      price: 109.95,
                                      description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                      category: "men's clothing",
                                      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                                      )

     static let sampleProduct2 = ProductDemo(id: 0002,
                                      title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                      price: 109.95,
                                      description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                      category: "men's clothing",
                                      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                                      )

     static let sampleProduct3 = ProductDemo(id: 0003,
                                      title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                      price: 109.95,
                                      description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                      category: "men's clothing",
                                      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                                      )

     static let products = [sampleProduct1, sampleProduct2, sampleProduct3]

 }

 
 
 
 
 */
