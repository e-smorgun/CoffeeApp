//
//  OrderViewModel.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Foundation
import RxRelay

class OrderViewModel {
    var orders: [Order] = []
    var coffeeArray = BehaviorRelay<[Order]>(value: [])

    func loadData(order: [Order]) {
        coffeeArray.accept(order)
    }

}
