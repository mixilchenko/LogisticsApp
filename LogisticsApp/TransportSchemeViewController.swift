//
//  TransportSchemeViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 18.03.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

class TransportSchemeViewController: UIViewController {

    var transportScheme: TransportScheme?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = transportScheme!.header
        label.attributedText = transportScheme!.description
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
