//
//  DataBase.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import Foundation


func obtenerProductos(completion: @escaping (Result<Any, Error>) -> Void) {
    // Define la URL de la API
    let url = URL(string: "https://fakestoreapi.com/products")!

    // Crea una tarea de URLSession para obtener los datos de la URL
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        // Comprueba si hay algún error
        if let error = error {
            completion(.failure(error))
            return
        }

        // Comprueba si se recibieron datos
        guard let data = data else {
            let error = NSError(domain: "No se recibieron datos", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }

        do {
            // Intenta decodificar los datos JSON en un objeto de tipo Any
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            completion(.success(json))
        } catch {
            completion(.failure(error))
        }
    }

    // Inicia la tarea
    task.resume()
    
}



