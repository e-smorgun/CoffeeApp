//
//  GiftViewController.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import UIKit
import RxRelay
import RxSwift

class GiftViewController: UIViewController, Storyboardable {

    @IBOutlet var rootVeiw: GiftView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = GiftViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All orders"

        tableView.register(UINib(nibName: "MyOrderCell", bundle: nil), forCellReuseIdentifier: "MyOrderCell")
        
        viewModel.orderArray.bind(to: tableView.rx.items(cellIdentifier: "MyOrderCell", cellType: MyOrderCell.self)) { index, item, cell in
            cell.configure(order: item)
        }.disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
    }
}
