//
//  ContactViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 18.03.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit
import MapKit

public class MKContact: NSObject, MKAnnotation {
    let id: String
    let address: String
    let city: String
    let phone: String
    let email: String
    public let coordinate: CLLocationCoordinate2D
    
    init(_ contact: Contact) {
        self.id = contact.id
        self.address = contact.address
        self.city = contact.city
        self.phone = contact.phone
        self.email = contact.email
        self.coordinate = CLLocation(latitude: Double(contact.lat), longitude: Double(contact.lon)).coordinate
        super.init()
    }
    
    public var title: String? {
        return address
    }
    
    public var subtitle: String? {
        return "\(phone), \(email)"
    }
}

class ContactViewController: UIViewController {

    var contact: MKContact?
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = contact!.city
        label.text = "\(contact!.phone)\n\n\(contact!.email)"
        map.setRegion(MKCoordinateRegionMakeWithDistance(contact!.coordinate, 1000, 1000), animated: true)
        map.addAnnotation(contact!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
