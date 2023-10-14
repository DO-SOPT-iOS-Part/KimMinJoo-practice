//
//  ViewController.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/14/23.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

final class FirstViewController_colorbox: UIViewController {
    
    private let colorbox = UIView().then {
        $0.backgroundColor = .yellow
    }
    private let colorbox2 = UIView().then {
        $0.backgroundColor = .green
    }
    
    private let colorbox3 = UIView().then {
        $0.backgroundColor = .black
    }
    private let colorbox4 = UIView().then {
        $0.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
}
private extension FirstViewController_colorbox {
    
    func style() {
        
        view.backgroundColor = .white
    }
    func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(colorbox)
        colorbox.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        
        self.view.addSubview(colorbox2)
        colorbox2.snp.makeConstraints {
            $0.top.equalTo(colorbox.snp.bottom)
            $0.leading.equalTo(colorbox.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        self.view.addSubview(colorbox3)
        colorbox3.snp.makeConstraints {
            $0.top.equalTo(colorbox2.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        self.view.addSubview(colorbox4)
        colorbox4.snp.makeConstraints {
            $0.top.equalTo(colorbox3.snp.bottom)
            $0.leading.equalTo(colorbox.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }
}
