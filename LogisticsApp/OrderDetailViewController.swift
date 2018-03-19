//
//  OrderDetailViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 29.01.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var order: Order?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = order!.id
        detailLabel.text = "Идентификатор: \(order!.id)\nСтатус: \(order!.status)\nГород: \(order!.city)"
        if let route = order!.route {
            detailLabel.text = detailLabel.text! + "\n\nМаршрут:\n\(route)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
