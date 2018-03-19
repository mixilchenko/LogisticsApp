//
//  MoreTableViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 18.03.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit
import SwiftyJSON

public struct Contact {
    var id: String
    var city: String
    var lat: Float
    var lon: Float
    var address: String
    var phone: String
    var email: String
}

public struct TransportScheme {
    var id: String
    var header: String
    var description: NSAttributedString
}

public struct Offer {
    var id: String
    var date_end: String
    var header: String
    var description: NSAttributedString
}

class HelpfulTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        // TODO: API запросы
        if let path = Bundle.main.path(forResource: "transport_schemes", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = JSON(data)
            for (_, subJson): (String, JSON) in json {
                transportSchemes.append(TransportScheme(id: subJson["id"].stringValue, header: subJson["header"].stringValue, description: subJson["description"].stringValue.toHTML()))
            }
        }
        
        if let path = Bundle.main.path(forResource: "offers", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = JSON(data)
            for (_, subJson): (String, JSON) in json {
                offers.append(Offer(id: subJson["id"].stringValue, date_end: subJson["date_end"].stringValue, header: subJson["header"].stringValue, description: subJson["description"].stringValue.toHTML()))
            }
        }
        
        if let path = Bundle.main.path(forResource: "contacts", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = JSON(data)
            for (_, subJson): (String, JSON) in json {
                contacts.append(Contact(id: subJson["id"].stringValue, city: subJson["city"].stringValue, lat: subJson["lat"].floatValue, lon: subJson["long"].floatValue, address: subJson["address"].stringValue, phone: subJson["phone"].stringValue, email: subJson["email"].stringValue))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 0 - схемы перевозок
        // 1 - спецпредложения
        // 2 - контакты
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // 0 - схемы перевозок
        // 1 - спецпредложения
        // 2 - контакты
        switch section {
        case 0:
            return "Основные схемы перевозок"
        case 1:
            return "Спецпредложения"
        case 2:
            return "Контакты"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 0 - схемы перевозок
        // 1 - спецпредложения
        // 2 - контакты
        switch section {
        case 0:
            return transportSchemes.count
        case 1:
            return 1 // потому что спецпредложения в отдельном окне
        case 2:
            return contacts.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        switch indexPath.section {
        case 0:
            selectedTransportScheme = transportSchemes[indexPath.row]
        case 2:
            selectedContact = contacts[indexPath.row]
        default:
            break
        }
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "toTransportScheme", sender: self)
        case 1:
            performSegue(withIdentifier: "toOffers", sender: self)
        case 2:
            performSegue(withIdentifier: "toContact", sender: self)
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpfulCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = transportSchemes[indexPath.row].header
        case 1:
            cell.textLabel?.text = "Спецпредложения (\(offers.count))"
        case 2:
            cell.textLabel?.text = contacts[indexPath.row].city
        default:
            break
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "toOffers":
            if let dest = segue.destination as? OffersTableViewController {
                dest.offers = offers
            }
        case "toTransportScheme":
            if let dest = segue.destination as? TransportSchemeViewController {
                dest.transportScheme = selectedTransportScheme
            }
        case "toContact":
            if let dest = segue.destination as? ContactViewController {
                dest.contact = MKContact(selectedContact!)
            }
        default:
            break
        }
    }
    
    @IBAction func unwindToHelpful(segue: UIStoryboardSegue) {
    }
    
    private var offers = [Offer]()
    private var transportSchemes = [TransportScheme]()
    private var contacts = [Contact]()
    private var selectedTransportScheme: TransportScheme?
    private var selectedContact: Contact?
}

