//
//  CoffeeCell.swift
//  CoffeeApp
//
//  Created by Evgeny on 7.10.22.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class CoffeeCell: UITableViewCell {
    @IBOutlet weak var coffeImage: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeVolumeLabel: UILabel!
    @IBOutlet weak var coffeeDescriptionLabel: UILabel!
    @IBOutlet weak var coffeePriceLabel: UILabel!
    
    func configure(coffee: Coffee) {
        coffeeNameLabel.text = coffee.coffeeName
        coffeeVolumeLabel.text = coffee.coffeeVolume
        coffeeDescriptionLabel.text = coffee.coffeeDescription
        coffeePriceLabel.text = String(coffee.coffeePrice)
        coffeImage.image = UIImage(named: coffee.nameImage)
    }
    
}
