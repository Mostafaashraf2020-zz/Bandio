//
//  HomeViewController.swift
//  Bandio
//
//  Created by DP on 12/17/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class HomeViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var collectionHome: UICollectionView!
    
    

    @IBOutlet weak var SliderCollectionHome: UICollectionView!
    var HomeData : HomeModel?
    @IBOutlet weak var page: UIPageControl!
    var timer = Timer()
    var counter = 0
    
    @IBOutlet weak var menuButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)

        
       
        
//            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        
        SliderCollectionHome.delegate = self
        SliderCollectionHome.dataSource = self
        
        SliderApi()
        
 
    }


    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SliderCollectionHome
        {
        return (HomeData?.slider!.count ??  0)
        }
        else
        {
            return(HomeData?.home!.count ?? 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == SliderCollectionHome
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellslider", for: indexPath) as!
        SliderCollectionViewCell
        cell.imageSlider.sd_setImage(with: URL(string:  ((HomeData?.slider?[indexPath.row].img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
            CollectionHomeCollectionViewCell
            cell.imageCollection.sd_setImage(with: URL(string:  ((HomeData?.home?[indexPath.row].img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
            cell.labelCollection.text = HomeData?.home?[indexPath.row].text
         
            return cell
            
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionHome
        {
            
            return CGSize(width: CGFloat(collectionView.frame.size.width / 2) - 10, height: 200)
            

        }
        return CGSize(width: CGFloat(collectionView.frame.size.width / 1) - 10, height: 300)    }
    
    
    
    
    func SliderApi() -> Void {
        
        let urlHome = "https://bandiooo.000webhostapp.com/public/api/home"
        
        Alamofire.request(urlHome, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ respones in
                //  print(respones)
                
                do {
                    let decoder = JSONDecoder()
                    let HomeData =  try decoder.decode(HomeModel.self, from: respones.data!)
                    self.HomeData = HomeData
                    self.SliderCollectionHome.reloadData()
                    self.collectionHome.reloadData()
                   
                    
                    
                    
                } catch let error
                {
                    print(error.localizedDescription)
                    
                }
        }
        
    }
    

}

    

  
    
    
  

