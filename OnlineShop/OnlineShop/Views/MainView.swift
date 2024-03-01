//
//  MainView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ProductListView(list: productos)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ContentView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
            ContentView()
                .tabItem {
                    Label("Order", systemImage: "cart.fill")
                }.badge(0)
            
            
        }
    }
}

#Preview {
    MainView()
}
