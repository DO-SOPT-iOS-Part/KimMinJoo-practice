//
//  ResultVC.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 2023/10/07.
//

import UIKit

enum ColorEnum {
    case pink
    case blue
}

class ResultVC: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var backButton: UIButton!
    
    var email: String = ""
    var password: String = ""
    
    var delegate: GetDataProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindText()
    }
}

extension ResultVC {
    
    private func setUI() {
        backButton.tintColor = .pink
    }
    
    private func bindText() {
        self.idLabel.text = "Email\n\(self.email)"
        self.passwordLabel.text = "Password\n\(self.password)"
    }
    
    private func switchColor(color: ColorEnum) {
        switch color {
        case .pink:
            self.heartImageView.image = Images.pinkHeart
            self.backButton.tintColor = .pink
            self.colorSegmentedControl.backgroundColor = .pink
        case .blue:
            self.heartImageView.image = Images.blueHeart
            self.backButton.tintColor = .blue
            self.colorSegmentedControl.backgroundColor = .blue
        }
    }
    
    @IBAction private func backButtonTapped(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: false)
        } else {
            self.dismiss(animated: false)
        }
        delegate?.getLoginData(email: self.email, password: self.password)
    }
    
    @IBAction private func changedColor(_ sender: Any) {
        switch colorSegmentedControl.selectedSegmentIndex {
        case 0:
            switchColor(color: .pink)
        case 1:
            switchColor(color: .blue)
        default:
            return
        }
    }
}

extension ResultVC {
    func setLabelText(id: String, password: String) {
        self.email = id
        self.password = password
    }
    
}
