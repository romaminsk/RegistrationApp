//
//  CodeVerifVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class CodeVerifVC: UIViewController {

    
    @IBOutlet private weak var codeLbl: UILabel!
    var titleText = ""
    var email: String?
    var name: String?
    var pass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeLbl.text = titleText
    }
    
    @IBAction private func codeField(_ sender: UITextField) {
        if codeLbl.text == sender.text {
            performSegue(withIdentifier: "ShowWelcomeScreen", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = email,
            let name = name,
            let pass = pass,
            let destVC = segue.destination as? WelcomeVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.pass = pass
    }
}
