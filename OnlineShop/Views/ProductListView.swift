//
//  ProductListView.swift
//  OnlineShop

//  Created by  on 23/2/24.


import SwiftUI

struct ProductListView: View {
    @ObservedObject var model = ProductsViewModel()
    @State private var showing = false
    var body: some View {

        NavigationSplitView{
            ZStack{
                List(model.products){ current in
                    Text(current.title)
                    Button(action: {
                                    showing.toggle()
                                }) {
                                    Text(current.title)
                                }/*.sheet(isPresented: $showing) {
                                    ProductModalView(producto: current)}*/
                    
                    
                    /* Button(action: {
                        showing.toggle()
                    }, label: {
                        ProductRowView(producto: current)
                    }).sheet(isPresented: $showing, content: {
                        ProductModalView(producto: current)
                    })*/
                    
                    
                }
            }
            
            
            .navigationTitle("Productos")
        }detail: {
            Text("...")
        }
        /*.onAppear {
            model. { error in
                if let error = error {
                    print("Error fetching products: \(error)")
                }
            }
        }*/
    }
}

var productos = ProductsViewModel()
#Preview {
    ProductListView()
}
