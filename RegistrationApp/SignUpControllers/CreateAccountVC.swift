//
//  CreateAccountVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var passwordProgress: UIProgressView!
    @IBOutlet weak var wrongEmailLblb: UILabel!
    @IBOutlet weak var weakPasswordLbl: UILabel!
    @IBOutlet weak var wrongPasswordLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
