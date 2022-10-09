//
//  ViewController.swift
//  CoffeeApp
//
//  Created by Evgeny on 4.10.22.
//

import UIKit

class StartViewController: UIViewController, Storyboardable {

    weak var coordinator: AuthCoordinator?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            self.coordinator?.start()
            
        }
    }
}


