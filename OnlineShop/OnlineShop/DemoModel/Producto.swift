//
//  Producto.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import Foundation



struct Product: Identifiable{
    let id: Int
    var title:String
    var price: Double
    var description: String
    var category: String
    var image: String
    
}


struct MockData{

    //static let rating = Rating(rate: 3.9, count: 120)

    static let sampleProduct1 = Product(id: 0001,
                                     title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                     price: 109.95,
                                     description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                     category: "men's clothing",
                                     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                                     )

    static let sampleProduct2 = Product(id: 0002,
                                     title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                     price: 109.95,
                                     description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                     category: "men's clothing",
                                     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                                     )

    static let sampleProduct3 = Product(id: 0003,
                                     title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                     price: 109.95,
                                     description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                     category: "men's clothing",
                                     image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                                     )

    static let products = [sampleProduct1, sampleProduct2, sampleProduct3]

}
