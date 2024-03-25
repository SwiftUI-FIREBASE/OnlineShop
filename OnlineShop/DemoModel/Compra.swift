//
//  Compra.swift
//  OnlineShop
//
//  Created by  on 11/3/24.
//

import Foundation
import FirebaseFirestore



class Compra : ObservableObject{
    @Published var order  : Order
    //private var db = Firestore.firestore()

    
    init() {
        self.order = Order()
    }
    func addTo(seleccion: ProductDemo){
        order.products.append(seleccion)
    }
    
    func emptyCar(){
        order.products = []
    }
    
    func calcularPrecio() -> Double{
        var valor = 0.0
        for producto in order.products {
            valor += producto.price
        }
        return valor
    }
    
    enum CodingKeys: String, CodingKey {
        case identify
        case productos

      }
    
    /*func upload(){
        do{
            try db.collection("Pedidos").addDocument(from: self.order)
        }catch let error{
            print("Error de escritura \(error)")
        }
        
    }*/
    
    

 
    
    
    
}
