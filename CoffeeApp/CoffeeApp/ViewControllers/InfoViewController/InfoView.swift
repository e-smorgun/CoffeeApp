//
//  InfoView.swift
//  CoffeeApp
//
//  Created by Evgeny on 8.10.22.
//

import Foundation

import Foundation
import UIKit

class InfoView: UIView {
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeDescriptionView: UILabel!
    @IBOutlet weak var confirmButton: UIButton! {
        didSet {
            confirmButton.layer.cornerRadius = 23
         }
    }
    @IBOutlet weak var backButton: UIButton!
    
}
