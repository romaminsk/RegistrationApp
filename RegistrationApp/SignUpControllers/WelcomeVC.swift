//
//  WelcomeVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var returnBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnBtn.titleLabel?.textAlignment = .center
    }

    @IBAction func cotinueBtn(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
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
