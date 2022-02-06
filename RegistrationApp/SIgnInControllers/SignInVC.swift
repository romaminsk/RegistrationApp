//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

final class SignInVC: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var userNotFoundLbl: UILabel!
    @IBOutlet private weak var signInOutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
        targetFields()
    }

    @IBAction private func signInBtn(_ sender: Any) {
    }

    @objc private func textFieldDidChange(_ sender: UITextField) {
        if emailField.text == "" &&
            passwordField.text == "" {
            signInOutBtn.isEnabled = false;
        } else {
            updateBtnState()
        }
    }
    
    private func targetFields() {
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    // не срабатывает оператор && отрабатывает, как или
    // часть имейла тоже пропускает (roma -- roma@roma.com)
    private func updateBtnState() {
        signInOutBtn.isEnabled = isKeyPresentInUserDefaults(key: emailField.text ?? "") &&
            isKeyPresentInUserDefaults(key: passwordField.text ?? "")
        signInOutBtn?.alpha = 1.0
    }

    private func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    private func setLoginButton() {
        signInOutBtn.layer.cornerRadius = 5
        signInOutBtn?.alpha = 0.5
        signInOutBtn.isEnabled = false;
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
