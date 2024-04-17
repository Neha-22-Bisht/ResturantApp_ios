//
//  LoginViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let userdetail = UserDefaults.standard.value(forKey: "username")
        //        if userdetail != nil {
        //            usernameTextField.text = UserDefaults.standard.value(forKey: "username") as? String
        //            passwordTextField.text = UserDefaults.standard.value(forKey: "password") as? String
        //        } else {
        //
        //        }
    }
    
    
    @IBAction func loginClicked(_sender:Any) {
        let alert = UIAlertController(title: "saving", message: "Do you want to save login details?", preferredStyle: .alert)
        
        let yesbutton = UIAlertAction(title: "yea", style: .default) { (action) in
            // write logic to check wether user entered the details or not
            
            UserDefaults.standard.setValue(self.usernameTextField.text!, forKey:"username")
            UserDefaults.standard.setValue(self.passwordTextField.text!, forKey:"password")
            self.performSegue(withIdentifier: "segue1", sender: self)
            
        }
        let nobutton = UIAlertAction(title: "no", style: .cancel) { (action) in
            print("you have not saved login details")
            self.performSegue(withIdentifier: "segue1", sender: self)
            
        }
        alert.addAction(yesbutton)
        alert.addAction(nobutton)
        self.present(alert,animated: true,completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "segue1"
        {
            let desVC = segue.destination as! HomeViewController
            desVC.userPass = "Hello \(usernameTextField.text ?? "")"
        }
    }
    
}





