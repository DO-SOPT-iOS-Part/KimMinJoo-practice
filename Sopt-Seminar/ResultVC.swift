//
//  ResultVC.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 2023/10/07.
//

import UIKit

class ResultVC: UIViewController {

    var email: String = ""
    var password: String = ""

//    private func bindText() {
//        self.emailLabel.text = "email : \(email)"
//        self.passwordLabel.text = "password : \(password)"
//    }
    
    func setLabelText(id: String,
                          password: String) {
        self.email = id
        self.password = password
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func pushToResultVC() {
//        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else {return}
//        resultVC.email = idText
//        resultVC.password = passwordText
//        self.navigationController?.pushViewController(resultVC, animated: true)
//    }
//        
//    func presentToResultVC() {
//        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
//        resultVC.email = idText
//        resultVC.password = passwordText
//        self.present(resultVC, animated: true)
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
//        if let navigationController = self.navigationController {
//            navigationController.popViewController(animated: true)
//        } else {
//            self.dismiss(animated: true)
//        }
        
    }

}
