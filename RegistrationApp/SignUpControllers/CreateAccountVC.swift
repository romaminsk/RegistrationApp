//
//  CreateAccountVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var passwordProgress: UIProgressView!
    @IBOutlet weak var wrongEmailLbl: UILabel!
    @IBOutlet weak var weakPasswordLbl: UILabel!
    @IBOutlet weak var wrongPasswordLbl: UILabel!
    @IBOutlet weak var emailOutField: UITextField!
    @IBOutlet weak var passwordOutField: UITextField!
    @IBOutlet weak var repeatPassOutField: UITextField!
    @IBOutlet weak var signUpOutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        signUpOutBtn.layer.cornerRadius = 5
        signUpOutBtn?.alpha = 0.5
        signUpOutBtn.isEnabled = false;
        emailOutField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailOutField.addTarget(self, action: #selector(checkEmail(_:)), for: .editingChanged)
        passwordOutField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPassOutField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPassOutField.addTarget(self, action: #selector(checkPasswordConfirmation(_:)), for: .editingChanged)
        
        passwordOutField.addTarget(self, action: #selector(checkPassword(_:)), for: .editingChanged)
        
        self.passwordProgress.setProgress(0, animated: true)
        self.weakPasswordLbl.textColor = UIColor.red
        self.weakPasswordLbl.text = ""
        self.weakPasswordLbl.isHidden = true
    }

    @IBAction func signInBtn(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func emailField(_ sender: Any) {
    }

    @IBAction func nameField(_ sender: Any) {
    }

    @IBAction func passwordField(_ sender: Any) {
    }

    @IBAction func repeatPasswordField(_ sender: Any) {
    }

    @IBAction func signUpBtn(_ sender: Any) {
    }
    
    @objc func checkEmail(_ sender: UITextField) {
        if !VerificationService.isValidEmail(email: emailOutField?.text ?? "") {
            wrongEmailLbl.isHidden = false
        } else {
            wrongEmailLbl.isHidden = true
        }
    }
    
//    Почему-то попадает только в первый и предпоследний if
    @objc func checkPassword(_ sender: UITextField) {
        if VerificationService.isPasswordPasswordWeakRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 0.1
            passwordProgress.tintColor = UIColor.red
            weakPasswordLbl.text = "Password is weak"
            weakPasswordLbl.isHidden = false
            weakPasswordLbl.textColor = UIColor.red
        } else if VerificationService.isPasswordPasswordNotVeryWeakRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 0.4
            passwordProgress.tintColor = UIColor.yellow
            weakPasswordLbl.text = "Password isn't very weak"
            weakPasswordLbl.isHidden = false
            weakPasswordLbl.textColor = UIColor.yellow
        } else if VerificationService.isPasswordPasswordNotVeryStrongRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 0.7
            passwordProgress.tintColor = UIColor.blue
            weakPasswordLbl.text = "Password isn't very strong"
            weakPasswordLbl.isHidden = false
            weakPasswordLbl.textColor = UIColor.blue
        } else if VerificationService.isPasswordPasswordStrongRegex(pass: passwordOutField?.text ?? "") {
            passwordProgress.progress = 1
            passwordProgress.tintColor = UIColor.green
            weakPasswordLbl.text = "Password is OK"
            weakPasswordLbl.isHidden = false
            weakPasswordLbl.textColor = UIColor.green
        }
    }
    
    @objc func checkPasswordConfirmation(_ sender: UITextField) {
        if !VerificationService.isPassCofirm(pass1: passwordOutField?.text ?? "", pass2: repeatPassOutField?.text ?? "") {
            wrongPasswordLbl.isHidden = false
        } else {
            wrongPasswordLbl.isHidden = true
        }
    }

    @objc func textFieldDidChange(_ sender: UITextField) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
