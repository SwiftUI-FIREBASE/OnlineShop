//
//  ProductModalView.swift
//  OnlineShop
//
//  Created by  on 1/3/24.
//

import SwiftUI

struct ProductModalView: View {
    @Environment(\.dismiss) var dismiss
    var producto: Product
    var body: some View {
        
        VStack(spacing: 15) {
                    Text("Detail Screen")
                    Button(action: {
                        
                    }) {
                        Text("Back")
                    }
                }
        .frame(maxWidth: 300, maxHeight: 500)
        .background(Color.red.opacity(0.3)).background(.ultraThinMaterial)
        
        /*VStack(spacing: 15){
            Text(producto.title)
            Text(producto.category)
            Text(String(producto.id))
            Button("Cerrar"){
                dismiss()
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)*/
    }
}

#Preview {
    ProductModalView(producto: productos[0])
}
