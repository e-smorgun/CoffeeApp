//
//  InfoViewController.swift
//  CoffeeApp
//
//  Created by Evgeny on 8.10.22.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class InfoViewController: UIViewController, Storyboardable {
    
    var didSendEventClosure: (() -> Void)?
    var didAddEventClosuree: ((Order) -> Void)?
    var viewModel = InfoViewModel()
    var disposeBag = DisposeBag()
    
    var coffee: Coffee?
    var order: Order?
    var index: Int = 0
    
    @IBOutlet var rootVeiw: InfoView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeDescriprionLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.rx.tap.subscribe(onNext: { [weak self]  in
            self?.didSendEventClosure?()
        }).disposed(by: disposeBag)
        
        addButton.rx.tap.subscribe(onNext: { [weak self]  in
            self?.order = self?.viewModel.convertOrder(coffee: (self?.coffee)!, index: (self?.index)!)
            self?.didAddEventClosuree?((self?.order!)!)
        }).disposed(by: disposeBag)
        
        coffeeNameLabel.text = coffee!.coffeeName
        coffeeImageView.image = UIImage(named: coffee!.nameImage)
        coffeeDescriprionLabel.text = coffee!.coffeeDescription
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            index = 1
        case 1:
            index = 2
        case 2:
            index = 3
        default:
            break
        }
    }
}
