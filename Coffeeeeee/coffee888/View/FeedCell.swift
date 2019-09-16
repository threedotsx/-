import UIKit
class FeedCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, phoneNumber: String, content: String) {
        self.profileImage.image = profileImage
        self.phoneLbl.text = phoneNumber
        self.contentLbl.text = content
    }
}
