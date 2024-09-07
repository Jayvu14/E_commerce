import Foundation
import Alamofire

class NetworkManager {
    private let reachabilityManager = NetworkReachabilityManager()
    
    func startNetworkReachabilityObserver() {
        // Ensure that listening starts
        reachabilityManager?.startListening { status in
            switch status {
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
            case .reachable(.cellular):
                print("The network is reachable over the WWAN connection")
            case .notReachable:
                print("The network is not reachable")
            case .unknown:
                print("It is unknown whether the network is reachable")
            }
        }
    }
}
