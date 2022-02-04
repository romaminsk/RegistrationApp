//
//  CreateAccountVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

final class CreateAccountVC: UIViewController {

    @IBOutlet private weak var passwordProgress: UIProgressView!
    @IBOutlet private weak var wrongEmailLbl: UILabel!
    @IBOutlet private weak var weakPasswordLbl: UILabel!
    @IBOutlet private weak var wrongPasswordLbl: UILabel!
    @IBOutlet private weak var emailOutField: UITextField!
    @IBOutlet private weak var nameOutField: UITextField!
    @IBOutlet private weak var passwordOutField: UITextField!
    @IBOutlet private weak var repeatPassOutField: UITextField!
    @IBOutlet private weak var signUpOutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setSignUpDutton()
        setTargetFields()
        setProgressBar()
        setPasswordLbl()
    }

    @IBAction private func signInBtn(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func emailField(_ sender: Any) {
    }

    @IBAction private func nameField(_ sender: Any) {
    }

    @IBAction private func passwordField(_ sender: Any) {
    }

    @IBAction private func repeatPasswordField(_ sender: Any) {
    }

    @IBAction private func signUpBtn(_ sender: Any) {
    }

    @objc private func checkEmail(_ sender: UITextField) {
        if !VerificationService.isValidEmail(email: emailOutField?.text ?? "") {
            wrongEmailLbl.isHidden = false
        } else {
            wrongEmailLbl.isHidden = true
        }
    }

//    Почему-то попадает только в первый и предпоследний if
    @objc private func checkPassword(_ sender: UITextField) {
        if VerificationService.isPasswordPasswordWeakRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 0.1
            passwordProgress.tintColor = UIColor.red
            weakPasswordLbl.text = "Password is weak"
            weakPasswordLbl.isHidden = false
        } else if VerificationService.isPasswordPasswordNotVeryWeakRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 0.4
            passwordProgress.tintColor = UIColor.yellow
            weakPasswordLbl.isHidden = true
        } else if VerificationService.isPasswordPasswordNotVeryStrongRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 0.7
            passwordProgress.tintColor = UIColor.blue
            weakPasswordLbl.isHidden = true
        } else if VerificationService.isPasswordPasswordStrongRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 1
            passwordProgress.tintColor = UIColor.green
            weakPasswordLbl.isHidden = true
        }
    }

    @objc private func checkPasswordConfirmation(_ sender: UITextField) {
        if !VerificationService.isPassCofirm(pass1: passwordOutField?.text ?? "", pass2: repeatPassOutField?.text ?? "") {
            wrongPasswordLbl.isHidden = false
        } else {
            wrongPasswordLbl.isHidden = true
        }
    }

    @objc private func textFieldDidChange(_ sender: UITextField) {
        if emailOutField.text == "" ||
            passwordOutField.text == "" ||
            repeatPassOutField.text == "" {
            signUpOutBtn.isEnabled = false;
            signUpOutBtn?.alpha = 0.5
        } else {
            signUpOutBtn.isEnabled = true;
            signUpOutBtn?.alpha = 1.0
        }
    }
    
    private func setSignUpDutton() {
        signUpOutBtn.layer.cornerRadius = 5
        signUpOutBtn?.alpha = 0.5
        signUpOutBtn.isEnabled = false;
    }
    
    private func setPasswordLbl() {
        weakPasswordLbl.textColor = UIColor.red
        weakPasswordLbl.text = ""
        weakPasswordLbl.isHidden = true
    }
    
    private func setProgressBar() {
        passwordProgress.setProgress(0, animated: true)
    }
    
    private func setTargetFields() {
        emailOutField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailOutField.addTarget(self, action: #selector(checkEmail(_:)), for: .editingChanged)
        passwordOutField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPassOutField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPassOutField.addTarget(self, action: #selector(checkPasswordConfirmation(_:)), for: .editingChanged)
        passwordOutField.addTarget(self, action: #selector(checkPassword(_:)), for: .editingChanged)
    }

    private func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? CodeVerifVC {
            detailViewController.titleText = randomString(length: 2)
        }
        guard let email = emailOutField.text,
            let name = nameOutField.text,
            let pass = passwordOutField.text,
            let destVC = segue.destination as? CodeVerifVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.pass = pass
    }
}
