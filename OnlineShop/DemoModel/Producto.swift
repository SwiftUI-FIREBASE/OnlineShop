import SwiftUI

<<<<<<< Updated upstream
import Foundation
import FirebaseFirestore



struct ProductDemo: Identifiable, Codable{
=======
struct ProductDemo: Identifiable {
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
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
=======
struct MockData {
    static let sampleProduct1 = ProductDemo(id: 1,
                                            title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                            price: 109.95,
                                            description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                            category: "men's clothing",
                                            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                            rating: ProductDemo.Rating(rate: 3.9))

    static let sampleProduct2 = ProductDemo(id: 2,
                                            title: "Another Product",
                                            price: 49.99,
                                            description: "Description of another product.",
                                            category: "women's clothing",
                                            image: "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UL640_QL65_ML3_.jpg",
                                            rating: ProductDemo.Rating(rate: 4.5))

    static let sampleProduct3 = ProductDemo(id: 3,
                                            title: "Yet Another Product",
                                            price: 29.99,
                                            description: "Description of yet another product.",
                                            category: "electronics",
                                            image: "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
                                            rating: ProductDemo.Rating(rate: 4.0))
>>>>>>> Stashed changes

    static let products = [sampleProduct1, sampleProduct2, sampleProduct3]
}
