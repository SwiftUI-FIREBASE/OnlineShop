//
//  OnlineShopApp.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI
import Firebase

@main
struct OnlineShopApp: App {
    var compra = Compra()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            /*var modelo = ProductsViewModel()
            var lista = modelo.products
            ProductListView(list: ProductsViewModel().products)*/
            MainView().environmentObject(compra)
            
        }
    }
}
