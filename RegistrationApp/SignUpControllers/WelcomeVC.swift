//
//  WelcomeVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet private weak var returnBtn: UIButton!

    var email: String?
    var name: String?
    var pass: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        returnBtn.titleLabel?.textAlignment = .center
    }

    @IBAction private func cotinueBtn(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
        guard let email = email,
            let name = name,
            let pass = pass
            else { return }
        UserDefaults.standard.set("email", forKey: email)
        UserDefaults.standard.set("name", forKey: name)
        UserDefaults.standard.set("password", forKey: pass)
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
