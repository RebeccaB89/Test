//
//  UIImageView+Load.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import UIKit

extension UIImageView {
    func load(url: URL?) {
        guard let url else {
            return
        }
        
        self.image = nil
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                guard let self else {
                    return
                }
                guard self.image == nil else {
                    return
                }
                self.image = image
            }
        }
    }
}
