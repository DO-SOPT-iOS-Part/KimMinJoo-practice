//
//  ViewController.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 2023/10/07.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private var idText: String = ""
    private var passwordText: String = ""
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControl()
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else { return }
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else { return }
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
//    @IBAction func loginButtonTapped(_ sender: Any) {
//        pushToResultVC()
//    }
//    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else {return}
        resultVC.setLabelText(id: self.idText,
                              password: self.passwordText)
        resultVC.delegate = self
        self.navigationController?.pushViewController(resultVC, animated: true)
        
        //        resultVC.loginDataCompletion = { data in
        //            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        //        }
    }
}

extension ViewController {
    private func setupControl() {
        idTextField.rx.text
            .orEmpty
            .bind(to: viewModel.emailObserver)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag)
        
        viewModel.isValid.bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map { $0 ? 1 : 0.3 }
            .bind(to: loginButton.rx.alpha)
            .disposed(by: disposeBag)
        
        
        loginButton.rx.tap.subscribe(
            onNext: { [weak self] _ in
                self?.pushToResultVC()
            }
        ).disposed(by: disposeBag)
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if !text.isEmpty {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
        return true
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
