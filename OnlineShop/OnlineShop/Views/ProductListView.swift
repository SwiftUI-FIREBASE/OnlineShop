//
//  ProductListView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ProductListView: View {
    var list: [Product]
    @State private var showing = false
    var body: some View {
        NavigationSplitView{
            ZStack{
                List(list){ current in
                    
                    Button(action: {
                                    showing.toggle()
                                }) {
                                    Text("Show Detail")
                                }.sheet(isPresented: $showing) {
                                    ProductModalView(producto: current)}
                    
                    
                    /* Button(action: {
                        showing.toggle()
                    }, label: {
                        ProductRowView(producto: current)
                    }).sheet(isPresented: $showing, content: {
                        ProductModalView(producto: current)
                    })*/
                    
                    
                }
            }
            
            
            .navigationTitle("Ciudades")
            
            /*.sheet(isPresented: $showing, content: {
                ProductModalView(producto: current)
            })*/
            
        }detail: {
            Text("Select Ciudad")
            
        }
    }
}

var productos = MockData.products
#Preview {
    ProductListView(list: productos)
}
