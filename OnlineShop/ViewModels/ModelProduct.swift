//
//  ModelProduct.swift
//  OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI


struct Product:Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let image:String
}

/*struct Product: Identifiable {
    let id: Int
    let title:String
    let price: Double
    let description: String
    let category: String
    let image: String
}*/

