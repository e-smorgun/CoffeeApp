//
//  OrderViewController.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//
import UIKit
import RxRelay
import RxSwift
import Firebase

class OrderViewController: UIViewController, Storyboardable {
    
    var didClearOrder: (() -> Void)?

    @IBOutlet var rootVeiw: OrderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    var disposeBag = DisposeBag()
    var viewModel = OrderViewModel()

    var price: Double = 0.0
    var orderStr: String = ""
    var orders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Your Order"
        
        tableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "OrderCell")

        viewModel.coffeeArray.bind(to: tableView.rx.items(cellIdentifier: "OrderCell", cellType: OrderCell.self)) { index, item, cell in
            cell.configure(order: item)
            self.price += item.coffeePrice
            self.priceLabel.text = String(self.price)
            self.orderStr += item.coffeeName
            self.orderStr += " "
        }.disposed(by: disposeBag)
        
        confirmButton.rx.tap.subscribe(onNext: { [weak self]  in
            if self?.orders.isEmpty == true {
                self?.showErrorAlert()
            } else { let ref = Database.database().reference().child("orders")
                ref.childByAutoId().updateChildValues(["user": Auth.auth().currentUser!.uid, "order" : self?.orderStr, "price" : self?.price, "status": false])
                self?.orders.removeAll()
                self?.viewModel.loadData(order: (self?.orders)!)
                self?.priceLabel.text = "0.0"
                self?.didClearOrder!()
                self?.showAlert()
            }
        }).disposed(by: disposeBag)    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData(order: orders)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Successfully", message: "Thanks for your order", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "You don't have an order", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
