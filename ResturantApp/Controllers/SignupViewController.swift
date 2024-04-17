//
//  SignupViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/3/24.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signupClicked(_sender:Any) {
        
        if usernameTextField.text != ""  && passwordTextField.text != "" && emailTextField.text != ""  {
            UserDefaults.standard.setValue(self.usernameTextField.text!, forKey:"username")
            UserDefaults.standard.setValue(self.passwordTextField.text!, forKey:"password")
            UserDefaults.standard.setValue(self.emailTextField.text!, forKey: "emailid")
            gotoLoginPage()
        } else {
            _ = UIAlertController(title: "SignUp", message: "Please fill all mandetory fields", preferredStyle: .alert)
            _ = UIAlertAction(title: "OK", style: .cancel)
        }
    
    }
    
    func gotoLoginPage() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}





