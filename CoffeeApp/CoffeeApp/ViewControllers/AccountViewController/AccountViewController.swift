//
//  AccountViewController.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Firebase
import RxRelay
import RxSwift
import RxCocoa

class AccountViewController: UIViewController, Storyboardable {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet var rootView: AccountView!
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButton.rx.tap.subscribe(onNext: { [weak self]  in
            do {
                try Auth.auth().signOut()
                print("logout")
            } catch {
                print(error)
            }
        }).disposed(by: disposeBag)
        
        rootView.accountNameLabel.text = Auth.auth().currentUser?.email
        }
}
