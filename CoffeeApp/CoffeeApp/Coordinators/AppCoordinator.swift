//
//  AppCoordinator.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func showLoginFlow()
    func showMainFlow()
}

class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
            
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }

    func start() {
        showLoginFlow()
    }
        
    func showLoginFlow() {
        let authCoordinator = AuthCoordinator.init(navigationController)
        authCoordinator.start()
        childCoordinators.append(authCoordinator)    }
    
    func showMainFlow() {
        let tabCoordinator = TabCoordinator.init(navigationController)
          tabCoordinator.start()
          childCoordinators.append(tabCoordinator)
    }
}

