//
//  FirstCoordinator.swift
//  CoffeeApp
//
//  Created by Evgeny on 4.10.22.
//

import Foundation
import UIKit

class Coordinators {
    
    var navagationController: UINavigationController
    var secondCoordinator: SecondCoordinator?
    var didFinishController: (()->Void)?
    var timer: Timer?
    
    init(navagationController: UINavigationController) {
        self.navagationController = navagationController
    }
    
    func start() {
        openFirstViewController()
    }
    
    func openFirstViewController() {
        let str = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = str.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else { return }
        
            self?.openNextScreen()
        }
        self.navagationController.pushViewController(viewController, animated: true)
    }
    
    func openNextScreen() {
//        let str = UIStoryboard(name: "Main", bundle: nil)
//        guard let viewController = str.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else { return }
        self.secondCoordinator?.start()
    }
}

