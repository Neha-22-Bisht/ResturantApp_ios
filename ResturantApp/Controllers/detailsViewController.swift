//
//  detailsViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/15/24.
//

import UIKit

class detailsViewController: UIViewController {
    @IBOutlet weak var showImage:UIImageView!
    @IBOutlet weak var descriptionLabel:UILabel!
    var getImage: UIImage?
    var getdescription: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        showImage.image = getImage ?? UIImage()
        descriptionLabel.text = getdescription
        
    }
    

    @IBAction func orderButton(_sender:Any){
        
    }

}
