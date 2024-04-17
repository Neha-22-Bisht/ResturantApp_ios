//
//  LoginViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailtext:UITextField!
    @IBOutlet weak var passwordtext:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_sender:Any){
        
        let userEmail = UserDefaults.standard.value(forKey: "emailid") as? String
        let password = UserDefaults.standard.value(forKey: "password") as? String
        
        if emailtext.text == userEmail ?? "" && emailtext.text != ""  && passwordtext.text == password ?? "" && passwordtext.text != "" {
            //self.performSegue(withIdentifier: "segue1", sender: self)
            gotoHomePage()
        } else {
            let alert = UIAlertController(title: "wrong", message: "Please enter correct email or password", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "cancel", style: .cancel) { (cancel) in}
            print("cancel sucessfully")
            alert.addAction(cancel)
            self.present(alert,animated: true, completion: nil)
            
             
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"
        {
            let desVC = segue.destination as! HomeViewController
            desVC.emailname = "Hello,\(emailtext.text!)"
        }
    }
    
    func gotoHomePage() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let navigationVC = storyBoard.instantiateViewController(withIdentifier: "HomeNavigationController") as? UINavigationController {
            self.navigationController?.modalPresentationStyle = .fullScreen
            self.navigationController?.present(navigationVC, animated: true)
        }
        
    }
    
}

