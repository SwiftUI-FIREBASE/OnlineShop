import SwiftUI
import Combine
import FirebaseFirestore

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    private var cancellable: AnyCancellable?
    private var db = Firestore.firestore()
    
    init(){
        fetchProducts()
    }
  

    
    func fetchProducts() {
        
        Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
            do{
                let weather_file = try await NetworkManager.shared.getProducts()
                self.products.append(weather_file)
            }catch{
                
                if let callError = error as? WEError {
                    switch callError{
                    case .invalidURL:
                        print("Invalid URL")
                    case .invalidResponse:
                        print("Invalid response")
                    case .invalidData:
                        print("Invalid data")
                    case .unableToComplete:
                        print("Unable to complete")
                    }
                    
                }else{
                    //Generic error
                    print("Invalid response")
                }
            }
        }
        /*obtenerProductos { result in
            switch result {
            case .success(let json):
                guard let jsonArray = json as? [[String: Any]] else {
                    completion(NSError(domain: "JSON no válido", code: 0, userInfo: nil))
                    return
                }
                
                self.products = jsonArray.compactMap { dict in
                    guard let id = dict["id"] as? Int,
                          let title = dict["title"] as? String,
                          let description = dict["description"] as? String,
                          let price = dict["price"] as? Double,
                            let image = dict["image"] as? String else {
                        return nil
                    }
                    
                    
                    self.products.append(Product(id: id, title: title, description: description, price: price, image: image))
                    return Product(id: id, title: title, description: description, price: price, image: image)
                }
                
                completion(nil)
                
            case .failure(let error):
                completion(error)
            }*/
        
    }
    
    func numberOfProducts() -> Int {
        return products.count
    }
    
    func product(at index: Int) -> Product {
        return products[index]
    }
    
    
    func upload(pedido: Compra){
        do{
            try db.collection("Pedidos").addDocument(from: pedido.order)
        }catch let error{
            print("Error de escritura \(error)")
        }
        
    }
}
