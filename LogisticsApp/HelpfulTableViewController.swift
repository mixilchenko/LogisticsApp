//
//  MoreTableViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 18.03.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

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
        transportSchemes.append(TransportScheme(id: "1",
                                                header: "Авиаперевозка грузов",
                                                description: "Прямая авиадоставка грузов из городов Китая (Пекин, Шанхай, Шэнчжень, Гуанчжоу, Ченду, Ухань, Гонконг), Вьетнама и др. стран Юго-Восточной Азии и Европы<br>Таможенное оформление в Москве и Белоруссии<br><b>Основные преимущества</b><br><ol><li>минимальные сроки доставки грузов;</li><li>гарантия сохранности хрупких и ценных грузов;</li><li>срочная доставка образцов товара.</li></ol>".toHTML()))
       
        contacts.append(Contact(id: "1", city: "Москва", lat: 55.889206, lon: 37.594090, address: "ул. Пришвина 8/2, офис 523", phone: "+7 (495) 215 24 73", email: "mow@atc-logistics.com"))
        contacts.append(Contact(id: "2", city: "Пекин", lat: 39.930866, lon: 116.443824, address: "3, Shuangshubeicun, Heizhuanghuxian, Chaoyang District, Beijing, China\n北京市朝阳区黑庄户乡双树北村3号院", phone: "+86 10 65180518\n+86 10 87305226", email: "bjs@atc-logistic.com"))
        
        offers.append(Offer(id: "1", date_end: "12.12.2018", header: "Скидка для Москвы", description: "<b>Для Москвы</b> действует скидка".toHTML()))
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

