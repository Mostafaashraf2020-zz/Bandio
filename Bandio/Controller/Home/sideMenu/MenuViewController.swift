//
//  MenuViewController.swift
//  Bandio
//
//  Created by DP on 12/17/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    let images = [UIImage(named: "iconcommon" ) ,
                  UIImage(named: "bagshopping" ) ,
                  UIImage(named: "wishlist" ) ,
                  UIImage(named: "contactus" )
    ]
    let menuetitle  = [("Order List"),(" Shopping Bag"),("Whishlist"),("Contact Us")]
    
    

    @IBOutlet weak var menuCollection: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        menuCollection.delegate = self
        menuCollection.dataSource = self
       self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuetitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuCollection.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! MenuTableViewCell
       cell.imageMenu.image = self.images[indexPath.row]
        cell.labelMenu.text = self.menuetitle[indexPath.row]
        return cell
        
    }
    

 

}
