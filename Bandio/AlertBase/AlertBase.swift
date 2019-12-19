//
//  AlertBase.swift
//  Bandio
//
//  Created by DP on 12/15/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import Foundation
import UIKit
class AlertBase {
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
