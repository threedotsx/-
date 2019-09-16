import UIKit

class GoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var goodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var good: Goods? {
        didSet {
            if let image = good?.image {
                goodImageView.image = UIImage(named: image)
            }
            if let name = good?.name {
                nameLabel.text = name
            }
            if let description = good?.description {
                descriptionLabel.text = description
            }
            if let price = good?.price {
                priceLabel.text = String(price) + " ₽"
            }
        }
    }
}
