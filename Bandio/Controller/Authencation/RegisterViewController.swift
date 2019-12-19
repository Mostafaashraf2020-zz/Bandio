//
//  RegisterViewController.swift
//  Bandio
//
//  Created by DP on 12/16/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController  {
    
  
    @IBOutlet weak var ImagePicker: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var brithday: UITextField!
    var RegisterData : RegisterModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // circle image
//        Image Picker.layer.masksToBounds = true
//        Image Picker.layer.cornerRadius = Image Picker.bounds.width / 2
//
        
    }
  
    
    @IBAction func signupButton(_ sender: Any) {
        
        guard let username = userName.text , !username.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "Email or password is empty", vc: self)
            return
        }
        guard let password = password.text , !password.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "Email or password is empty", vc: self)
            return
        }
        guard let password_confirmation = confirmPassword.text , !password_confirmation.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "confirmPassword is empty", vc: self)
            return
        }
        guard let email = emailTxt.text , !email.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "emailTxt is empty", vc: self)
            return
        }
        guard let birthdate = brithday.text , !birthdate.isEmpty else{
            AlertBase.showBasic(title: "Error", message: "brithday is empty", vc: self)
            return
        }
        
        
        
        
        
        
        
        let RegisterParams = [ "username" : username ,
                               "email" : email ,
                               "birthdate" : birthdate ,
                               "password" : password ,
                               "password_confirmation" : password_confirmation ]
        
        Alamofire.request(Urls.Register, method:.post, parameters: RegisterParams, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (respones) in
                switch respones.result
                {
                case .failure(let error) :
                    print(error)
                case.success(  _):
                    do{
                        
                        let decoder = JSONDecoder()
                        let RegisterData = try
                            decoder.decode(RegisterModel.self, from: respones.data!)
                        self.RegisterData = RegisterData
                        if  RegisterData.stat == 200 && RegisterData.msg == "success"
                        {
                            print(RegisterData.msg!)
                            
                            
                        }
                        else{
                           // print(RegisterData.msg)
                            
                            AlertBase.showBasic(title: "Alert", message: RegisterData.msg!, vc: self)
                            
                        }
                    } catch let error
                    {
                        print(error.localizedDescription)
                        
                    }
                    
                    
                    
                }
                
        }
        
    }
    
    
    
    
    
}
