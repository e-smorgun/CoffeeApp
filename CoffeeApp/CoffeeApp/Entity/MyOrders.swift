//
//  MyOrders.swift
//  CoffeeApp
//
//  Created by Evgeny on 9.10.22.
//

import Foundation
import Firebase

class MyOrders: Codable {
    var orderCoffe: String = ""
    var orderPrice: Double = 0.0
    var orderStatus: Bool = false
    
    init(orderCoffe: String, orderPrice: Double, orderStatus: Bool) {
        self.orderCoffe = orderCoffe
        self.orderPrice = orderPrice
        self.orderStatus = orderStatus
    }
}
