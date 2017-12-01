//
//  UdicycleModel.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import Foundation

class UdicycleModel {
    static var savedActivities = [CyclingActivity]()
    
    public static var MAX_ROWS = 30
    
    public func saveActivity(_ newActivity: CyclingActivity) {
        UdicycleModel.savedActivities.append(newActivity)
    }
    
    public func generateCycling(_ maxRow: Int) -> [CyclingActivity] {
        var arrs = [CyclingActivity]()
        arrs += UdicycleModel.savedActivities
        for _ in 0..<maxRow {
            let cycling = CyclingActivity(title: Randoms.randomFakeName(), date: Date.random(), distance: Double.random(), photoUrl: Randoms.randomImageUrl())
            
            arrs.append(cycling)
        }
        return arrs
    }
    
}
