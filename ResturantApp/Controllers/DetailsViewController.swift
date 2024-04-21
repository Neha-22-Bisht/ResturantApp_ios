//
//  DetailsViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/15/24.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var showImage:UIImageView!
    @IBOutlet weak var descriptionLabel:UILabel!
    
    var selecteditem: (itemName: String, itemimage: String, description: String)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage.image = UIImage(named: selecteditem?.itemimage ?? "")
        descriptionLabel.text = selecteditem?.description
    }
    
    @IBAction func orderButton(_sender:Any){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let orderVC = storyBoard.instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController {
            orderVC.itemInfo = selecteditem
            self.navigationController?.pushViewController(orderVC, animated: true)
        }
    }
    
}
