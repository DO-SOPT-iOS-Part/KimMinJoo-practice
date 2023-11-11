//
//  AutoLayoutViewController.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/14/23.
//

import UIKit

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
        
        let height = UIScreen.main.bounds.height / 4
        let width = UIScreen.main.bounds.width / 2
        NSLayoutConstraint.activate([yellowColorbox.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     yellowColorbox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     yellowColorbox.heightAnchor.constraint(equalToConstant: height),
                                     yellowColorbox.widthAnchor.constraint(equalToConstant: width)])
        
        NSLayoutConstraint.activate([greenColorbox.topAnchor.constraint(equalTo: self.yellowColorbox.bottomAnchor),
                                     greenColorbox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     greenColorbox.heightAnchor.constraint(equalToConstant: height),
                                     greenColorbox.widthAnchor.constraint(equalToConstant: width)])
        
        NSLayoutConstraint.activate([blackColorbox.topAnchor.constraint(equalTo: self.greenColorbox.bottomAnchor),
                                     blackColorbox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     blackColorbox.heightAnchor.constraint(equalToConstant: height),
                                     blackColorbox.widthAnchor.constraint(equalToConstant: width)])
        
        NSLayoutConstraint.activate([blueColorbox.topAnchor.constraint(equalTo: self.blackColorbox.bottomAnchor),
                                     blueColorbox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     blueColorbox.heightAnchor.constraint(equalToConstant: height),
                                     blueColorbox.widthAnchor.constraint(equalToConstant: width)])
        
    }
}
