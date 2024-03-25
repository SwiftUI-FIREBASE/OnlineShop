//
//  MainView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var compra : Compra
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ContentView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
            ShoppingView().environmentObject(compra)
                .tabItem {
                    Label("Order", systemImage: "cart.fill")
                }.badge((compra.order.products.isEmpty) ? 0: compra.order.products.count)
            
            
        }
    }
}

#Preview {
    MainView().environmentObject(Compra())
}
