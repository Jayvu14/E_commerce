import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    private let url = "https://dummyjson.com/product"
    
    func fetchProducts(completion: @escaping (Result<ProductEmodel, Error>) -> Void) {
        AF.request(url).responseDecodable(of: ProductEmodel.self) { response in
            switch response.result {
            case .success(let ProductEmodel):
                completion(.success(ProductEmodel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
