//
//  CyclingFavoriteCollectionViewCell.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import UIKit

class CyclingFavoriteCollectionViewCell: UICollectionViewCell {
    static let identifier = "cyclingCustomCell"
    
    @IBOutlet weak var cyclingImage: UIImageView!
    @IBOutlet weak var cyclingTitle: UILabel!
    @IBOutlet weak var cyclingDistance: UILabel!
    @IBOutlet weak var cyclingDate: UILabel!
}
