import UIKit
import Alamofire

class APICallViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        APIManager.shared.fetchProducts { result in
//            switch result {
//            case .success(let productEmodel):
//                print("Products fetched successfully: \(ProductEmodel.products)")
//                for products in ProductEmodel.products {
//                    print("Product Title: \(products.title)")
//                }
//            case .failure(let error):
//                print("Error fetching products: \(error.localizedDescription)")
//            }
//        }
        let networkManager = NetworkManager()
        networkManager.startNetworkReachabilityObserver()
    }
}
