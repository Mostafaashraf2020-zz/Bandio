//
//  LoginViewController.swift
//  Bandio
//
//  Created by DP on 12/15/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    var LoginData : LoginModel?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func signupButn(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondePage = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.present(secondePage, animated: true, completion: nil)
        
    }
    @IBAction func loginButton(_ sender: UIButton) {
    

        
        guard let username = userName.text , !username.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "Email or password is empty", vc: self)
            return
        }
        guard let pass = password.text , !pass.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "Email or password is empty", vc: self)
            return
        }
        let loginParams = [ "username" : username ,
                           "password" : pass ]
        
    Alamofire.request(Urls.Login, method:.post, parameters: loginParams, encoding: URLEncoding.default, headers: nil)
        .responseJSON { (respones) in
            switch respones.result
            {
            case .failure(let error) :
                print(error)
            case.success(  _):
                do{
                    
                    let decoder = JSONDecoder()
                    let LoginData = try
                        decoder.decode(LoginModel.self, from: respones.data!)
                    self.LoginData = LoginData
                    if  LoginData.stat == 200
                    {
                        print("succes")
                       

                    }
                    else{
                        
                        AlertBase.showBasic(title: "Alert", message: LoginData.msg!, vc: self)
                    
                    }
                } catch let error
                {
                    print(error.localizedDescription)
                    
                }
                
                
                
            }
            
        }
        
        
        
        
        
        
    }
    
    

}
