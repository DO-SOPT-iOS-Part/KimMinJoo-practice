//
//  AutoLayoutViewController.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/14/23.
//

import UIKit

import SnapKit
import Then

class AutoLayoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    private let yellowColorbox: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenColorbox: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blackColorbox: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let blueColorbox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
}

extension AutoLayoutViewController {
    
    private func setLayout() {
        [yellowColorbox, greenColorbox, blackColorbox, blueColorbox].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([yellowColorbox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     yellowColorbox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     yellowColorbox.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     yellowColorbox.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([greenColorbox.topAnchor.constraint(equalTo: self.yellowColorbox.bottomAnchor, constant: 0),
                                     greenColorbox.leadingAnchor.constraint(equalTo: self.yellowColorbox.trailingAnchor, constant: 0),
                                     greenColorbox.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     greenColorbox.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([blackColorbox.topAnchor.constraint(equalTo: self.greenColorbox.bottomAnchor, constant: 0),
                                     blackColorbox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     blackColorbox.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     blackColorbox.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([blueColorbox.topAnchor.constraint(equalTo: self.blackColorbox.bottomAnchor, constant: 0),
                                     blueColorbox.leadingAnchor.constraint(equalTo: self.blackColorbox.trailingAnchor, constant: 0),
                                     blueColorbox.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     blueColorbox.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        

    }
}
