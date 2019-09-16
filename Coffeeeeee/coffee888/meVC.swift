import UIKit
import Firebase

class meVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
   @IBAction func logoutButton(_ sender: Any) {
      let logoutPopup = UIAlertController(title: "Выйти?", message: "Вы уверены, что хотите выйти??", preferredStyle: .actionSheet)
       let logoutAction = UIAlertAction(title: "Выйти?", style: .destructive) { (buttonTapped) in
         do {
          try Auth.auth().signOut()
               let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController
                self.present(authVC!, animated: true, completion: nil)
            } catch {
               print(error)
            }
      }
          logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
      }
   
    
}
