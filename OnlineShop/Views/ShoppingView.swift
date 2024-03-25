//
//  ShoppingView.swift
//  OnlineShop
//
//  Created by  on 11/3/24.
//

import SwiftUI

struct ShoppingView: View {
    @EnvironmentObject var compra:Compra
    
    var body: some View {
        VStack {
            NavigationView {
                if compra.order.products.isEmpty {
                    ProgressView("Loading...")
                } else {
                    List(compra.order.products) { product in
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text(product.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("$\(product.price)")
                                .font(.subheadline)
                        }
                    }
                    .navigationTitle("Products")
                }
            }
            Button(action:{
                ProductsViewModel().upload(pedido: compra)
                compra.emptyCar()
                    } ) {
                        Text("Comprar $\(String (format: "%.2f", compra.calcularPrecio()))")
                            .padding()
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(10)
                    }
        }
            
        }
        
    }


#Preview {
    ShoppingView().environmentObject(Compra())
}
