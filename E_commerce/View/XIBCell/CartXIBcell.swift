import UIKit

class CartXIBcell: UICollectionViewCell {
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productButtton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        productView.layer.cornerRadius = 8
        productButtton.layer.cornerRadius = 5
    }

}
