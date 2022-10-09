//
//  MenuViewModel.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Foundation
import RxSwift
import RxRelay

class MenuViewModel {
    let coffeeEspresso = Coffee(coffeeName: "Espresso", coffeePrice: 1.5, coffeeVolume: "150ml / 200ml / 350ml", coffeeDescription: "The Italian answer to your immediate caffeine need", nameImage: "Espresso")
    let coffeeCappuccino = Coffee(coffeeName: "Cappuccino", coffeePrice: 1.5, coffeeVolume: "150ml / 200ml / 350ml", coffeeDescription: "Espresso-based drink with the addition of warmed frothed milk", nameImage: "Cappuccino")
    let coffeeAmericano = Coffee(coffeeName: "Americano", coffeePrice: 1.5, coffeeVolume: "150ml / 200ml / 350ml", coffeeDescription: "Espresso-based drink further diluted with water", nameImage: "Americano")
    let coffeeRaf = Coffee(coffeeName: "Raf", coffeePrice: 1.5, coffeeVolume: "150ml / 200ml / 350ml", coffeeDescription: "Hot coffee drink based on espresso, vanilla sugar and heavy cream", nameImage: "Americano")
   
    var coffeeArray = BehaviorRelay<[Coffee]>(value: [])
    
    func loadData() {
        var coffeeArr: [Coffee] = []
        coffeeArr.append(coffeeEspresso)
        coffeeArr.append(coffeeCappuccino)
        coffeeArr.append(coffeeAmericano)
        coffeeArr.append(coffeeRaf)

        coffeeArray.accept(coffeeArr)
    }
    
    func findItem(index: Int) -> Coffee {
        var coffeeArr: [Coffee] = []
        coffeeArr.append(coffeeEspresso)
        coffeeArr.append(coffeeCappuccino)
        coffeeArr.append(coffeeAmericano)
        coffeeArr.append(coffeeRaf)
        
        return coffeeArr[index]
    }
}
