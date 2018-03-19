//
//  OrdersViewController.swift
//  LogisticsApp
//
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit
import SwiftyJSON

public struct Order {
    var id: String
    var status: String
    var location: String
    var route: String?
}

class OrdersViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var acceptSearchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !isLoaded {
            loadData()
        }
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }

    func loadData() {
        
        if UserDefaults.standard.isLoggedIn() {
            // TODO: API запрос
            if let path = Bundle.main.path(forResource: "orders", ofType: "json") {
                let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = JSON(data)
                for (_, subJson): (String, JSON) in json {
                    orders.append(Order(id: subJson["id"].stringValue, status: subJson["status"].stringValue, location: subJson["location"].stringValue, route: subJson["route"].stringValue))
                }
            }
            filteredOrders = orders.filter({(order: Order) -> (Bool) in true})
            isLoaded = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOrders.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedOrder = filteredOrders[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell")!
        
        let order = filteredOrders[indexPath.row]
        cell.textLabel?.text = order.id
        cell.detailTextLabel?.text = order.status
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "toOrderDetail":
            if let dest = segue.destination as? OrderDetailViewController {
                dest.order = selectedOrder
            }
        default:
            break
        }
    }
    
    @IBAction func searchAccepted(_ sender: Any) {
        if UserDefaults.standard.isLoggedIn() {
            if !isLoaded {
                loadData()
            }
            filteredOrders = orders.filter({(order: Order) -> (Bool) in searchBar.text!.count > 0 ? order.id.contains(searchBar.text!) : true})
        }
        else {
            // API запрос на 1 order
        }
        tableView.reloadData()
    }
    
    @IBAction func unwindToOrders(segue: UIStoryboardSegue) {
    }
    
    private var isLoaded = false
    private var orders = [Order]()
    private var filteredOrders = [Order]()
    private var selectedOrder: Order?
}

