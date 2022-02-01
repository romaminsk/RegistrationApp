//
//  CodeVerifVC.swift
//  RegistrationApp
//
//  Created by Roma on 31.01.22.
//

import UIKit

class CodeVerifVC: UIViewController {

    
    @IBOutlet weak var codeLbl: UILabel!
    @IBOutlet weak var continueOutBtn: UIButton!
    @IBOutlet weak var codeOutField: UITextField!
    
    var titleText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeLbl.text = titleText
        codeOutField.addTarget(self, action: #selector(checkCode(_:)), for: .editingChanged)
    }
    
    @IBAction func codeField(_ sender: Any) {
    }
    
    @IBAction func continueBtn(_ sender: Any) {
    }
    
    @objc func checkCode(_ sender: UITextField) {
        if codeLbl.text == codeOutField.text {
            continueOutBtn.isEnabled = true;
        } else {
            continueOutBtn.isEnabled = false;
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
