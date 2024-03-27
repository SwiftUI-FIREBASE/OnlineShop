// Manager/NetworkManager.swift
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()    
    private let baseUrl = "https://fakestoreapi.com/products"
    
    func getProducts() async throws -> [Product]{
        guard let completeUrl =  URL(string: baseUrl) else {
            throw WEError.invalidURL("URL INVALIDA")
            
        }
        
        let(data, response) = try await URLSession.shared.data(from: completeUrl)
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode([Product].self, from: data)
        }catch{
            print("Error Data")
            throw WEError.invalidData
        }
    }
}
