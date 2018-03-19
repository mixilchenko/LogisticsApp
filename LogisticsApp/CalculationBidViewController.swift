//
//  SecondViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 29.01.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

class CalculationBidViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var organizationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func confirmButtonClick(_ sender: UIButton) {
        let name = nameTextField.text!
        let organization = organizationTextField.text!
        let phone = phoneTextField.text!
        let email = emailTextField.text!
        let description = descriptionTextView.text
        var alert = UIAlertController(title: "Заявка принята", message: "\(name) из \(organization)!\nВаша заявка принята", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(s: UIAlertAction) -> () in self.clearFields()}))
        present(alert, animated: false, completion: nil)
    }
    
    func clearFields() {
        nameTextField.text = ""
        organizationTextField.text = ""
        phoneTextField.text = ""
        emailTextField.text = ""
        descriptionTextView.text = ""
    }
    
}

