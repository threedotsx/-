import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class AuthCodeViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var signIn: UIButton!
    var userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        code.delegate = self
       hideKeyboardThenTappedAround()
    }
    @IBAction func SignInApp(_ sender: Any) {
        if code.text?.isEmpty == true {
            debugPrint("Enter your verification code!")
            return
        }
        guard let otpCode = code.text else {return}
        
        guard let verificationID = userDefaults.string(forKey: "verificationId") else {return}
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: otpCode)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error == nil {
                print("User Signed In")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "authSegue", sender: self)
                }
            } else {
                print ("something wrong \(error?.localizedDescription)")
            }
        }
    }
}


