import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
    class AuthViewController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        hideKeyboardThenTappedAround()
        } 
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
          if userDefaults.bool(forKey: "UserSignedIn") {
                performSegue(withIdentifier: "authSegue", sender: self)
          }
            }
        @IBAction func buttonAction(_ sender: Any) {
            performSegue(withIdentifier: "codeAuthSegue", sender: nil)
          if phoneNumberTextField.text?.count == 11 {
              debugPrint("Enter your Phone number!")
            }
            guard let phoneNumber = phoneNumberTextField.text else {return}
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationId, error) in
                if error == nil {
                    print(verificationId)
                    guard let verifyid = verificationId else {return}
                    self.userDefaults.set(verifyid, forKey: "verificationId")
                    self.userDefaults.synchronize()
                } else {
                    print("something", error?.localizedDescription)
                }
                
            }
}

}
