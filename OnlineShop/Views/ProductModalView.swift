
//  ProductModalView.swift
//  OnlineShop

//  Created by  on 1/3/24.


import SwiftUI

struct ProductModalView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var compra:Compra
    var producto: Product
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Color(red: 245/255, green: 245/255, blue: 220/255)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    producto.loadImage()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .edgesIgnoringSafeArea(.top)
                    
                    Spacer()
                    
                    DescriptionView(producto: producto)
                        .background(Color("Bg"))
                        .cornerRadius(20)
                        .offset(y: -40)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action:{
                            compra.addTo(seleccion: producto)
                        } ) {
                            Text("\(String (format: "%.2f", producto.price)) €  Añadir")
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.red)
                                        .cornerRadius(10)
                                }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct DescriptionView: View {
    var producto: Product
    
    var body: some View {
        VStack (alignment: .leading){
            Text(producto.title) // Usar el título del producto en lugar de un texto estático
            
            HStack (spacing: 4){
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < Int(producto.rating.rate) ? "star.fill" : "star")
                        .foregroundColor(.yellow)

                }
                Text("(\(producto.rating.rate))")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(producto.description) // Usar la descripción del producto
            
            Spacer()
            
            HStack {
                VStack (alignment: .leading){
                    Text("Colores")
                        .fontWeight(.semibold)
    
                    HStack {
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: .blue)
                    }
                }
                Spacer() // Pushes the price to the right
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}






/*
#Preview {
    ProductModalView(producto: MockData.sampleProduct1).environmentObject(Compra())
}*/

/*struct ProductModalView_Previews: PreviewProvider {
    static var previews: some View {
        ProductModalView(producto: ProductDemo(id: 1,
                                               title: "Fjallraven Foldsack No. 1 Backpack, Fits 15 Laptops",
                                               price: 109.95,
                                               description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                               category: "men's clothing",
                                               image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                               rating: ProductDemo.Rating(rate: 4.9))).environmentObject(Compra())

    }
}*/
 
