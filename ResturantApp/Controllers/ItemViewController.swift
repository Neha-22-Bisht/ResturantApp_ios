//
//  ItemViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/8/24.
//

import UIKit

class ItemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
//    var description = ["vegkabab is very good","samosa is very good"]
    // outlets
    @IBOutlet weak var tableView: UITableView!
    
    //variables
    var selectedItems:[(itemName: String, itemimage: String)] = []
    var selectedCategoryName: String = ""
    
    // used to feed the data in tableview
    let itemDetails: [String : [(itemName: String, itemimage: String)]] = [
"Staters": [("Vegkabab", "Vegkabab"), ("samosa", "Samosa"),("Idli", "IdliSambhar")],
                                            "Softdrinks": [("sprite", "Sprite"), ("coco-cola", "Cocacola"),("pepsi", "Pepsi")],
                                            "Veg" : [("Rajma", "RajmaChawal"), ("chole", "CholeBhature"),("buttermakki", "DalMakhni")],
                                            "Non-Veg" : [("Chicken", "Chicken"), ("Biryani", "Biryani"),("Mutton", "Mutton")],
                                            "Desserts" : [("kheer", "Kheer"), ("gajar halwa", "Gajar Halwa "),("rasmalai", "Rasmalai ")],
                                            "Water Bottles" :[("Bisleri", "Bisleri"), ("aquafina", "Aquafina"),("Kinley", "kinley")]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        // data parsing from dictionary
        selectedItems = itemDetails[selectedCategoryName] ?? []
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        cell?.nameLabel.text = selectedItems[indexPath.row].itemName
        cell?.nameimage.image = UIImage(named: selectedItems[indexPath.row].itemimage)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "detailsViewController") as! detailsViewController
        dvc.getImage = UIImage(named: selectedItems[indexPath.row].itemimage)
        dvc.getdescription = selectedItems[indexPath.row].itemName
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}


