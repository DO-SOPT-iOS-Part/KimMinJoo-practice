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
    
    private let disposeBag = DisposeBag()
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else { return }
        resultVC.setLabelText(id: self.idText, password: self.passwordText)
        resultVC.delegate = self
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
}

extension ViewController {
    private func bindViewModel() {
        idTextField.rx.text
            .orEmpty
            .do(onNext: { [weak self] text in
                self?.idText = text
            })
            .bind(to: viewModel.emailObserver)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .do(onNext: { [weak self] text in
                self?.passwordText = text
            })
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag)
        
        viewModel.isValid.bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.subscribe(
            onNext: { [weak self] _ in
                self?.pushToResultVC()
            }
        ).disposed(by: disposeBag)
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
