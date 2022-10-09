//
//  TabBarCoordinator.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Foundation
import UIKit

enum TabBarPage {
    case menu
    case gift
    case order
    case account

    init?(index: Int) {
        switch index {
        case 0:
            self = .menu
        case 1:
            self = .gift
        case 2:
            self = .order
        case 3:
            self = .account
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .menu:
            return "Menu"
        case .gift:
            return "Gift"
        case .order:
            return "Order"
        case .account:
            return "Account"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .menu:
            return 0
        case .gift:
            return 1
        case .order:
            return 2
        case .account:
            return 3
        }
    }
}

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    var orders: [Order] = []
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        let pages: [TabBarPage] = [.menu, .gift, .order, .account]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = UIColor(red: 0.294, green: 0.29, blue: 0.459, alpha: 1)
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.menu.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())

        switch page {
        case .menu:
            let menuVC = MenuViewController.createObject()
            menuVC.didGoToInfoController = { [weak self] coffee in
                self?.showInfoController(coffee: coffee)
            }
            navController.pushViewController(menuVC, animated: true)
        case .gift:
            let giftVC = GiftViewController.createObject()
            navController.pushViewController(giftVC, animated: true)
        case .order:
            let orderVC = OrderViewController.createObject()
            orderVC.orders = orders
            orderVC.didClearOrder = { [weak self] in
                self?.orders.removeAll()
            }
            navController.pushViewController(orderVC, animated: true)
        case .account:
            let accountVC = AccountViewController.createObject()
            navController.pushViewController(accountVC, animated: true)
        }
        
        return navController
    }
}

extension TabCoordinator {
    func showInfoController(coffee: Coffee) {
        let infoVC = InfoViewController.createObject()
        infoVC.coffee = coffee
        infoVC.didSendEventClosure = { [weak self] in
            self?.start()
        }
        infoVC.didAddEventClosuree = { [weak self] order in
            self?.orders.append(order)
            self?.start()
        }
        navigationController.pushViewController(infoVC, animated: true)
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
    }
}

