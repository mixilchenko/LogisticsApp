//
//  SecondViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 29.01.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit
import MessageUI

class CalculationBidViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
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
        if !validateData() {
            return
        }
        let message = createMessage()
        sendMail(message)
        clearFields()
    }
    
    func validateData() -> Bool {
        var alertText = ""
        let name = nameTextField.text!
        if name.count == 0 {
            alertText += "Введите ФИО\n"
        }
        let organization = organizationTextField.text!
        if organization.count == 0 {
            alertText += "Введите компанию\n"
        }
        let phone = phoneTextField.text!
        if phone.count == 0 {
            alertText += "Введите телефон\n"
        }
        let email = emailTextField.text!
        if email.count == 0 {
            alertText += "Введите email\n"
        }
        if alertText.count > 0 {
            let alert = UIAlertController(title: "Не верные данные", message: alertText, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    func createMessage() -> String {
        let name = nameTextField.text!
        let organization = organizationTextField.text!
        let phone = phoneTextField.text!
        let email = emailTextField.text!
        let description = descriptionTextView.text!
        
        let message = "ФИО: \(name);\nКомпания: \(organization);\nТелефон: \(phone);\nE-mail: \(email);\nОписание: \(description)"
        return message
    }
    func sendMail(_ message: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["example@example.com"])
            mail.setSubject("Заявка на расчёт")
            mail.setMessageBody(message, isHTML: true)
            
            present(mail, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func clearFields() {
        nameTextField.text = ""
        organizationTextField.text = ""
        phoneTextField.text = ""
        emailTextField.text = ""
        descriptionTextView.text = ""
    }
    
}

