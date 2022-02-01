//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class SignInVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNotFoundLbl: UILabel!
    @IBOutlet weak var signInOutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        signInOutBtn.layer.cornerRadius = 5
        signInOutBtn?.alpha = 0.5
        signInOutBtn.isEnabled = false;
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func signInBtn(_ sender: Any) {
    }

    @objc func textFieldDidChange(_ sender: UITextField) {
        if emailField.text == "" || passwordField.text == "" {
            signInOutBtn.isEnabled = false;
            signInOutBtn?.alpha = 0.5
        } else {
            signInOutBtn.isEnabled = true;
            signInOutBtn?.alpha = 1.0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
