import UIKit

class EcommerceViewController: UIViewController {
    
    var objecommerce: [EcommerceModel] = []
   
    @IBOutlet weak var ecartButton: UIButton!
    @IBOutlet weak var esearch: UISearchBar!
    @IBOutlet weak var ebackButton: UIButton!
    @IBOutlet weak var ecommerceCollectiionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ecommerceCollectiionView.dataSource = self
        ecommerceCollectiionView.delegate = self
        ecommerceCollectiionView.register(UINib(nibName: "CartXIBcell", bundle: nil), forCellWithReuseIdentifier: "CartXIBcell")
 
        objecommerce = [EcommerceModel(eCategory: "HeadPhone", eImage: "Airpod1", ePrice: 199.99),
                        EcommerceModel(eCategory: "Earphone", eImage: "Airpod2", ePrice: 200.00),
                        EcommerceModel(eCategory: "Earbud", eImage: "Airpod3", ePrice: 299.30),
                        EcommerceModel(eCategory: "Airpod", eImage: "Airpod4", ePrice: 355.00),
                        EcommerceModel(eCategory: "Airpod-1", eImage: "Airpod5", ePrice: 355.00),
                        EcommerceModel(eCategory: "Airpod-2", eImage: "Airpod6", ePrice: 449.00),
                        EcommerceModel(eCategory: "Airpod-3", eImage: "Airpod7", ePrice: 688.00),
                        EcommerceModel(eCategory: "Airpod-4", eImage: "Airpod8", ePrice: 588.00),
                        EcommerceModel(eCategory: "Airpod-5", eImage: "Airpod9", ePrice: 882.00),
                        EcommerceModel(eCategory: "Airpod-6", eImage: "Airpod10", ePrice: 389.00)]
        
    }
}
extension EcommerceViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objecommerce.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartXIBcell", for: indexPath) as? CartXIBcell {
            cell.productCategory.text = objecommerce[indexPath.item].eCategory
            cell.productImage.image = UIImage(named: objecommerce[indexPath.item].eImage)
            cell.productPrice.text = "$ \(objecommerce[indexPath.item].ePrice)"
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 16) / 2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}

