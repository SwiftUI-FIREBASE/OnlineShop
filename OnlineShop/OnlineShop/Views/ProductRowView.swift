//
//  ProductRowView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ProductRowView: View {
    var producto:Product
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: producto.image)){ phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 150)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            Spacer().frame(width: 30)
            Text(producto.title).padding()
            /*AsyncImage(url:URL(string:producto.image)){
                image in
                
                image.image?.resizable().aspectRatio(contentMode: .fit)
            }*/
            Spacer().frame(width: 30)
            Text(String(producto.price))
        }.padding()
    }
}

var datos_exam = MockData.sampleProduct1
#Preview {
    ProductRowView(producto: datos_exam)
}
