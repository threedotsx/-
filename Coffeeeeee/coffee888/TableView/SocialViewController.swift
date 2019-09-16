import UIKit
import SafariServices

class SocialViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBAction func instagram(_ sender: SAButton) {
        showSafariVC(for: "https://vk.com/away.php?to=https%3A%2F%2Finstagram.com%2Fcafe888cafe%3Futm_source%3Dig_profile_share%26igshid%3D1afg9txv2fr7i&cc_key=")
    }
    func showSafariVC (for url: String) {
    guard let url = URL(string: url) else {
        return
        }
        let SafariVC = SFSafariViewController (url: url)
        present (SafariVC, animated: true)
    }
    @IBAction func VKbutton(_ sender: SAButton) {
        showSafariVC(for: "https://vk.com/feed")
    }
    @IBAction func MailButton(_ sender: SAButton) {
        showSafariVC(for: "https://gmail.ru")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "BackgroundImage")
        self.view.insertSubview(backgroundImage, at: 0)
}
}
