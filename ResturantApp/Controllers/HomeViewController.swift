//
//  HomeViewController.swift
//  ResturantApp
//
//  Created by Kamal Harariya on 4/2/24.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
//    var itemDetails = [itemsName]
    let productName = ["Staters","Softdrinks","Veg","Non-Veg","Desserts","Water Bottles"]
    let images:[String] = ["staters","softdrink","veg","nonveg","dessert","mineralwater"]
    

    @IBOutlet weak var mylabel:UILabel!
    var emailname:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // register custom cell to collectionview
        myCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nibBundle), forCellWithReuseIdentifier: "CollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.reloadData()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.itemTitle.text = productName[indexPath.row]
        cell.itemImageView.image = UIImage(named: images[indexPath.row])
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 5
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (myCollectionView.frame.size.width-70)/2
        print("size is \(size)")
        return CGSize(width: size, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemvc = storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
        itemvc?.selectedCategoryName = productName[indexPath.item]
        self.navigationController?.pushViewController(itemvc!, animated: true)
    }

}

