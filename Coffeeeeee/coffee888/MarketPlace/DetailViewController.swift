import UIKit

class DetailViewController: UIViewController {
    
    var good = Goods()
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var goodImageView: UIImageView! {
        didSet {
            guard let image = good.image else { return }
            goodImageView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            guard let name = good.name else { return }
            nameLabel.text = name
        }
    }
    @IBOutlet weak var descriptionLabel: UITextField! {
        didSet {
            guard let description = good.description else { return }
            descriptionLabel.text = description
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            guard let price = good.price else { return }
            priceLabel.text = String(price) + " ₽"
        }
    }
    @IBOutlet weak var countTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countTextField.text = "1"
        hideKeyboardThenTappedAround()
    }
    
    @IBAction func handleOrder(_ sender: UIButton) {
        if let newCount = Int(countTextField.text!) {
            var newItem = Cart()
            newItem.name = good.name
            newItem.image = good.image
            newItem.price = good.price
            newItem.count = newCount
            cartArray.append(newItem)
            Order.sharedInstance.sum += newItem.price! * newItem.count!
        }
        self.navigationController?.popViewController(animated: true)
    }
}
