//
//  ContentView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = ProductsViewModel()
    @State private var showing = false
    
    var body: some View {
        NavigationView {
            if viewModel.products.isEmpty {
                ProgressView("Loading...")
            } else {
                List(viewModel.products) { product in
                    /*VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text(product.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("$\(product.price)")
                            .font(.subheadline)
                    }*/
                    Button(action: {
                                    showing.toggle()
                                }) {
                                    VStack(alignment: .leading) {
                                        Text(product.title)
                                            .font(.headline)
                                        Text(product.description)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Text("$\(product.price)")
                                            .font(.subheadline)
                                    }
                                }.sheet(isPresented: $showing) {
                                    ProductModalView(producto: product)}
                }
                .navigationTitle("Products")
            }
        }
        .onAppear {
            viewModel.fetchProducts { error in
                if let error = error {
                    print("Error fetching products: \(error)")
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


