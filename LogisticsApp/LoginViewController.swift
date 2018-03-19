//
//  LoginViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 18.03.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        if (signIn(login: login, password: password)){
            performSegue(withIdentifier: "unwindToMenu", sender: sender)
        }
        else {
            let alert = UIAlertController(title: "Неверные данные", message: "Введён неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func signIn(login: String, password: String) -> Bool {
        // TODO: API запрос, который проверяет логин и пароль и возвращает либо ошибку, либо токен
        if (login == "wrong") {
            return false
        }
        if (password == "wrong") {
            return false
        }
        UserDefaults.standard.logIn()
        UserDefaults.standard.setToken(value: "token")
        return true
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
