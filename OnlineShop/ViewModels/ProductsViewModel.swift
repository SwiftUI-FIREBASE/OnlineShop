import SwiftUI
import Combine
import FirebaseFirestore

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    private var cancellable: AnyCancellable?
    private var db = Firestore.firestore()
    
    
    
    func fetchProducts(completion: @escaping (Error?) -> Void){
        obtenerProductos { result in
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
                          let image = dict["image"] as? String,
                          let rating = dict["rating"] as? Product.Rating else {
                              return nil
                          }
                    
                    
                    
                    self.products.append(Product(id: id, title: title, price: price, description: description, image: image, rating: rating))
                    return Product(id: id, title: title, price: price, description: description, image: image, rating: rating)
                }
                
                completion(nil)
                
            case .failure(let error):
                completion(error)
            }
        }
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
