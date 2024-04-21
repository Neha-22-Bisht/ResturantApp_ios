//
//  OrderViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/17/24.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var referenceNumber: UILabel!
    @IBOutlet weak var orderDetails:UILabel!
    
    var itemInfo: (itemName: String, itemimage: String, description: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderDetails.text = itemInfo?.description
        // Do any additional setup after loading the view.
    }
    
    // Action for done button. this is just a comment. 
    @IBAction func doneButton(_sender:Any){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
