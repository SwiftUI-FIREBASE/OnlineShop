//
//  ProductListView.swift
//  OnlineShop

//  Created by  on 23/2/24.


import SwiftUI

struct ProductListView: View {

    @ObservedObject var model = ProductsViewModel()

    @State private var selectedProduct: Product? = nil

    @State private var isProductSelected: Bool = false

    @State private var isDarkMode: Bool = false // Estado para el modo oscuro

    var body: some View {

        NavigationView {

            ZStack {

                // Lista de productos con efecto de desenfoque

                List(model.products) { current in

                    HStack {

                        // Imagen del producto

                        AsyncImage(url: URL(string: current.image)) { image in

                            image

                                .resizable()

                                .aspectRatio(contentMode: .fit)

                                .frame(width: 100, height: 100)

                        } placeholder: {

                            ProgressView()

                        }

                        .padding(.trailing, 10)


                        // Información del producto

                        VStack(alignment: .leading) {

                            Text(current.title)

                                .font(.headline)

                                .padding(.bottom, 5)


                            Text("\(current.price) €")

                                .font(.subheadline)

                                .foregroundColor(.red)

                        }

                    }

                    .onTapGesture {

                        // Cuando se toca un producto, se marca como seleccionado

                        selectedProduct = current

                        isProductSelected = true

                    }

                }

                .navigationTitle("Productos")

                .opacity(isProductSelected ? 0.5 : 1.0)

                .blur(radius: isProductSelected ? 10 : 0)


                // Vista superpuesta para mostrar la imagen seleccionada

                if isProductSelected {

                    if let selectedProduct = selectedProduct {

                        VStack {

                            Spacer()

                            // Imagen seleccionada

                            AsyncImage(url: URL(string: selectedProduct.image)) { image in

                                image

                                    .resizable()

                                    .aspectRatio(contentMode: .fit)

                                    .frame(maxWidth: .infinity)

                            } placeholder: {

                                ProgressView()

                            }

                            .background(Color.white)

                            .edgesIgnoringSafeArea(.top)

                            .frame(maxHeight: .infinity)

                            .onTapGesture {

                                // Al tocar la imagen superpuesta, restablece el producto seleccionado

                                self.selectedProduct = nil

                                isProductSelected = false

                            }


                            // Información del producto seleccionado

                            DescriptionView(producto: selectedProduct)

                                .background(Color("Bg"))

                                .cornerRadius(20)

                                .offset(y: -40)


                            Spacer()

                        }

                    }

                }

            }

            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {

                    HStack {

                        // Sol y Luna para el modo claro/oscuro
                        Button(action: {
                            isDarkMode.toggle()
                            // Cambiar el modo de interfaz según el estado del toggle
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                               let window = windowScene.windows.first {
                                window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                            }
                        }) {
                            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                                .font(.system(size: 20))
                        }

                    }
                    .padding(10)
                }

            }

        }
    }
}


#Preview {
    ProductListView()
}
