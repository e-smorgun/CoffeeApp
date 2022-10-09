//
//  GiftViewModel.swift
//  CoffeeApp
//
//  Created by Evgeny on 6.10.22.
//

import Foundation
import RxRelay
import Firebase

class GiftViewModel {
    var orderArray = BehaviorRelay<[MyOrders]>(value: [])
    var ref: DatabaseReference!

    func loadData() {
        var orderArr: [MyOrders] = []
        var userID: String = Auth.auth().currentUser!.uid
        ref = Database.database().reference()
        print(userID)
        ref.child("orders").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String : NSDictionary] {
                for (_, value) in value {
                    if value["user"]! as? String == userID {
                        print(value["user"]!)
                        var order: MyOrders = MyOrders(orderCoffe: value["order"] as! String, orderPrice: value["price"] as! Double, orderStatus: value["status"] as! Bool)
                        orderArr.append(order)
                    }
                }
                self.orderArray.accept(orderArr)
            }
        }) { error in
        print(error.localizedDescription)
        }
    }
}

