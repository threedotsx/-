import UIKit
import Firebase
class CreateFeedVC: UIViewController {
    @IBOutlet weak var FeedLbl: UILabel!
    @IBOutlet weak var createFeed: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var feedText: UITextView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        feedText.delegate = self
       hideKeyboardThenTappedAround()
    }

    @IBAction func postFeed(_ sender: Any) {
        if feedText.text != nil && feedText.text != "Пора что-то написать уже здесь" {
            createFeed.isEnabled = false
            DataService.instance.uploadPost(withMessage: feedText.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: {(isComplete) in
                if isComplete {
                    self.createFeed.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else {
                    self.createFeed.isEnabled = true
                    print("There was an error")
                }
            })
        }
        
    }
        @IBAction func closeButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
}
}
    extension CreateFeedVC: UITextViewDelegate {
        func textViewDidBeginEditing(_ feedText: UITextView) {
            feedText.text = ""
        }
    }



