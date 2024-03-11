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
                        //rollDice(value1: &diceValue_1, value2: &diceValue_2)
                    } ) {
                        Text("Roll")
                            .padding()
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(10)
                    }.shadow(color: .red, radius: 15, y: 5)
        }
            
        }
        
    }


#Preview {
    ShoppingView().environmentObject(Compra())
}
