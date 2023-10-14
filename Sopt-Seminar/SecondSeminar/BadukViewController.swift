//
//  BadukViewController.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/14/23.
//


import UIKit

class BadukViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout() {
        [baduk1, baduk2, shield].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([baduk1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     baduk1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     baduk1.widthAnchor.constraint(equalToConstant: 20),
                                     baduk1.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([baduk2.topAnchor.constraint(equalTo: self.baduk1.bottomAnchor, constant: 40),
                                     baduk2.leadingAnchor.constraint(equalTo: self.baduk1.trailingAnchor, constant: 40),
                                     baduk2.widthAnchor.constraint(equalToConstant: 20),
                                     baduk2.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([shield.leadingAnchor.constraint(equalTo: baduk2.trailingAnchor, constant: 20),
                                     shield.topAnchor.constraint(equalTo: baduk2.bottomAnchor, constant: 20),
                                     shield.widthAnchor.constraint(equalToConstant: 60),
                                     shield.heightAnchor.constraint(equalToConstant: 20)])
        

    }
    
    var baduk1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,
                                                                  height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var baduk2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,
                                                                  height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    var shield: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
}
