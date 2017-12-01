//
//  Extensions.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func downloadImageAsync(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard error == nil else {
                print(error ?? "Erro ao baixar a imagem")
                return
            }
            DispatchQueue.main.async { [weak self] in
                let image = UIImage(data: data!)
                self?.image = image
            }
            
            }.resume()
    }
}
