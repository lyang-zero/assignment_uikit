//
//  UIImageView_Extension.swift
//  iOSAssignment(UIKit)
//
//  Created by Alex Yang on 2022-01-27.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            var image = UIImage(named: "Default_Image")
            if let data = try? Data(contentsOf: url),
                let imageFromUrl = UIImage(data: data) {
                image = imageFromUrl
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
