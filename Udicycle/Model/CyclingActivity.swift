//
//  CyclingActivity.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import Foundation

struct CyclingActivity {
    var title: String
    var date: Date
    var distance: Double
    var photoUrl: String
    
    var distanceFormatted: String {
        get {
            return "\(Double(round(1000*self.distance)/1000)) Km/h"
        }
    }
}
