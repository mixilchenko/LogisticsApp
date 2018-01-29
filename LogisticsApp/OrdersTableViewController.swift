//
//  FirstViewController.swift
//  LogisticsApp
//
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    func loadData() {
        // TODO: load data from json
        ids = Array(repeating: "id 123456789", count: 20)
        statuses = Array(repeating: "ДТ выпущена", count: 20)
        cities = Array(repeating: "Москва", count: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (!isLoaded)
        {
            loadData()
            isLoaded = true
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ids.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableViewCell")!
        
        cell.textLabel?.text = ids[indexPath.row]
        cell.detailTextLabel?.text = statuses[indexPath.row]
        
        return cell
    }

    private var isLoaded = false
    private var ids = [String]()
    private var statuses = [String]()
    private var cities = [String]()
}

