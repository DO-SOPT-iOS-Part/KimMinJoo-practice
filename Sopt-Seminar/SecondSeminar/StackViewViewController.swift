//
//  StackViewViewController.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/14/23.
//

import UIKit


class StackViewViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private let whiteColorbox: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
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

extension StackViewViewController {
    
    private func setLayout() {
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [yellowColorbox, greenColorbox, blackColorbox, blueColorbox].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
    }
}

