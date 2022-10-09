//
//  MyOrderCell.swift
//  CoffeeApp
//
//  Created by Evgeny on 9.10.22.
//

import Foundation
import UIKit

class MyOrderCell: UITableViewCell {
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configure(order: MyOrders) {
        orderLabel.text = order.orderCoffe
        priceLabel.text = String(order.orderPrice)
        if order.orderStatus == true {
            statusLabel.text = "Taken away"
            statusLabel.textColor = .green
        } else {
            statusLabel.text = "Not taken away"
            statusLabel.textColor = .red
        }
    }
    
}
