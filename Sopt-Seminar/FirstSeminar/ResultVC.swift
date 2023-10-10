//
//  ResultVC.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 2023/10/07.
//

import UIKit

class ResultVC: UIViewController {
    
//    var loginDataCompletion: (([String]) -> Void)?    // closure
    
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    
    var email: String = ""
    var password: String = ""
    
    var delegate: GetDataProtocol?

    private func bindText() {
        self.IdLabel.text = "email : \(email)"
        self.PasswordLabel.text = "password : \(password)"
    }
    
    func setLabelText(id: String, password: String) {
        self.email = id
        self.password = password
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.email, password: self.password)
        
//        guard let loginDataCompletion else {return}
//        loginDataCompletion([self.email, self.password])  // closure
    }
}
