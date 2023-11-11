//
//  UIImage+.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/11/23.
//

import UIKit

extension UIImage {
    
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
