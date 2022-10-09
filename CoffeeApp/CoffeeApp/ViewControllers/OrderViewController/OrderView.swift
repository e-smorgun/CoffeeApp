//
//  OrderView.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Foundation
import UIKit

class OrderView: UIView {
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            
        }
    }
    @IBOutlet weak var confirmButton: UIButton! {
        didSet {
            confirmButton.layer.cornerRadius = 23
         }
    }
}
