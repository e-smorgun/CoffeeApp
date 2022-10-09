//
//  SecondCoordinator.swift
//  CoffeeApp
//
//  Created by Evgeny on 4.10.22.
//

import Foundation

import Foundation
import UIKit

class SecondCoordinator {
    
    var didFinishCoordinator: (()->Void)?

    init() {}
    
    func start() {
        openFirstViewController()
    }
    
    func openFirstViewController() {
        print(123)
        let str = UIStoryboard(name: "SecondFlow", bundle: nil)
        guard let viewController = str.instantiateViewController(withIdentifier: "AuthorizationViewController") as? AuthorizationViewController else { return }
        
    }
}

