import UIKit

class ScrollCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var goodImageView: UIImageView!

        var good: ScrollViewImage? {
            didSet {
                if let image = good?.image {
                goodImageView.image = UIImage(named: image)
            }
        
                }
       
            }
        }

