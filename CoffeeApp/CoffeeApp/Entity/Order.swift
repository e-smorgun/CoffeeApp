//
//  Order.swift
//  CoffeeApp
//
//  Created by Evgeny on 9.10.22.
//

import Foundation

class Order {
    var coffeeName: String = ""
    var coffeePrice: Double = 0.0
    var coffeeInformation: String = ""
    var nameImage: String = ""
    
    init(coffeeName: String, coffeePrice: Double, coffeeInformation: String, nameImage: String) {
        self.coffeeName = coffeeName
        self.coffeePrice = coffeePrice
        self.coffeeInformation = coffeeInformation
        self.nameImage = nameImage
    }
}
