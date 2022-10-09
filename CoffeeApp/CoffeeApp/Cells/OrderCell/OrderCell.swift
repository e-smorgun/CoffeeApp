//
//  OrderCell.swift
//  CoffeeApp
//
//  Created by Evgeny on 9.10.22.
//

import Foundation
import UIKit

class OrderCell: UITableViewCell {
    
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeInformationLabel: UILabel!
    @IBOutlet weak var coffeeImage: UIImageView!
    @IBOutlet weak var coffeePriceLabel: UILabel!
    
    func configure(order: Order) {
        coffeeNameLabel.text = order.coffeeName
        coffeePriceLabel.text = String(order.coffeePrice)
        coffeeInformationLabel.text = order.coffeeInformation
        coffeeImage.image = UIImage(named: order.nameImage)
    }
    
}
