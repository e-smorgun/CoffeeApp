//
//  AccountView.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Foundation
import UIKit

class AccountView: UIView {
    
    @IBOutlet var logoutButton: UIButton! {
        didSet {
            logoutButton.layer.cornerRadius = 23
         }
    }
    
    @IBOutlet weak var accountNameLabel: UILabel!
}
