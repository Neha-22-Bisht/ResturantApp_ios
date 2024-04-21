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
    var selectedItems:[(itemName: String, itemimage: String, description: String)] = []
    var selectedCategoryName: String = ""
    
    // used to feed the data in tableview
    let itemDetails: [String : [(itemName: String, itemimage: String, description: String)]] = [
"Staters": [("Vegkabab", "Vegkabab","Veg kabab is very delicious food"), ("samosa","Samosa", "SaSamosa is very delicious food")],
                                            "Softdrinks": [("sprite", "Sprite","Sprite is very refreshing drink"), ("coco-cola", "Cocacola","cocacola is very refreshing drink"),("pepsi", "Pepsi","Pepsi is very refreshing drink")],
                                            "Veg" : [("Rajma", "RajmaChawal","Rajma chawal is very delicious food"), ("chole", "CholeBhature","CholeBhatura is very delicious food"),("buttermakki", "DalMakhni","dal makhni is very delicious food")],
                                            "Non-Veg" : [("Chicken", "Chicken","Schicken is very delicious food"), ("Biryani", "Biryani","Biryani is very delicious food"),("Mutton", "Mutton","Mutton is very delicious food")],
                                            "Desserts" : [("kheer", "Kheer","kheer is very delicious food"), ("gajar halwa", "Gajar Halwa ","gajar halwa is very delicious food"),("rasmalai", "Rasmalai ","rasmalai is very delicious food")],
                                            "Water Bottles" :[("Bisleri", "Bisleri","mineral water"), ("aquafina", "Aquafina","mineral water"),("Kinley", "kinley","mineral water")]]
    
    
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
        let dvc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        dvc.selecteditem = selectedItems[indexPath.row]
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}


