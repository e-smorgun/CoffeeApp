//
//  Coffee.swift
//  CoffeeApp
//
//  Created by Evgeny on 7.10.22.
//

import Foundation
import UIKit

class Coffee {
    var coffeeName: String = ""
    var coffeePrice: Double = 0.0
    var coffeeVolume: String = ""
    var coffeeDescription: String = ""
    var nameImage: String = ""
    
    init(coffeeName: String, coffeePrice: Double, coffeeVolume: String, coffeeDescription: String, nameImage: String) {
        self.coffeeName = coffeeName
        self.coffeePrice = coffeePrice
        self.coffeeVolume = coffeeVolume
        self.coffeeDescription = coffeeDescription
        self.nameImage = nameImage
    }
}
