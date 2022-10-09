//
//  InfoViewModel.swift
//  CoffeeApp
//
//  Created by Evgeny on 8.10.22.
//

import Foundation

class InfoViewModel {
    
    func convertOrder(coffee: Coffee, index: Int) -> Order {
        var price = coffee.coffeePrice
        var information: String = ""
        
        switch index {
        case 1:
            information = "150ml"
            break
        case 2:
            price += 1.0
            information = "200ml"
            break
        case 3:
            price += 1.5
            information = "300ml"
            break
        default:
        break
        }
        
        let order: Order = Order(coffeeName: coffee.coffeeName, coffeePrice: price, coffeeInformation: information, nameImage: coffee.nameImage)

        return order
    }
}
