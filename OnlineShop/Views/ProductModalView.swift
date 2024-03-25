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
        
        ZStack{
            
            VStack(spacing: 15) {
                Text("Detail Screen")
                Button(action: {
                    dismiss()
                    
                }) {
                    VStack(alignment: .leading) {
                        Text(producto.title)
                            .font(.headline)
                        Text(producto.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("$\(producto.price)")
                            .font(.subheadline)
                    }
                }
            }
            .frame(maxWidth: 300, maxHeight: 500)
            .background(.white).background(.ultraThinMaterial).opacity(0.2)
        }.frame(maxWidth: 300, maxHeight: 500)
            .background(.white).background(.ultraThinMaterial).opacity(0.2)
    }
}

/*#Preview {
 ProductModalView(producto: productos[0])
 }
 */
