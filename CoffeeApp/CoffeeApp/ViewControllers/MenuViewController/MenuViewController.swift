//
//  MenuViewController.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import RxRelay
import RxSwift

class MenuViewController: UIViewController, Storyboardable{

    @IBOutlet var rootVeiw: MenuView!
    @IBOutlet weak var tableView: UITableView!
    
    var didGoToInfoController: ((Coffee) -> Void)?
    
    var disposeBag = DisposeBag()
    weak var coordinator: AppCoordinator?
    var viewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu"

        tableView.register(UINib(nibName: "CoffeeCell", bundle: nil), forCellReuseIdentifier: "CoffeeCell")
        
        viewModel.coffeeArray.bind(to: tableView.rx.items(cellIdentifier: "CoffeeCell", cellType: CoffeeCell.self)) { index, item, cell in
            cell.configure(coffee: item)
        }.disposed(by: disposeBag)
                           
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            let coffee: Coffee = (self?.viewModel.findItem(index: indexPath.row))!
            self?.didGoToInfoController?(coffee)
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
    }

}
