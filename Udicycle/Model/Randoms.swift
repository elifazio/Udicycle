//
//  Randoms.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import Foundation

public struct Randoms {
    
    public static func randomFakeName() -> String {
        let firstNameList = ["Trilha"]
        let lastNameList = ["da Capelinha", "do Bom Jardim", "do Telefone", "do Pão de Queijo", "da Cruz Branca", "Floresta do Lobo", "Cachoeira das Irmãs", "Petrobrás", "do ET", "Facão 1 e Facão 2", "da Biquinha", "Tenda dos Morenos", "do Marimbondo", "do Sucupira"]
        return firstNameList.randomItem()! + " " + lastNameList.randomItem()!
    }
    public static func randomImageUrl() -> String {
        return "https://picsum.photos/\(Int.random(0, 900) + 100)/?random"
    }
}

public extension Array {
    /// SwiftRandom extension
    public func randomItem() -> Element? {
        guard self.count > 0 else {
            return nil
        }
        
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

public extension Date {
    /// SwiftRandom extension
    public static func randomWithinDaysBeforeToday(_ days: Int) -> Date {
        let today = Date()
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let r1 = arc4random_uniform(UInt32(days))
        let r2 = arc4random_uniform(UInt32(23))
        let r3 = arc4random_uniform(UInt32(59))
        let r4 = arc4random_uniform(UInt32(59))
        
        var offsetComponents = DateComponents()
        offsetComponents.day = Int(r1) * -1
        offsetComponents.hour = Int(r2)
        offsetComponents.minute = Int(r3)
        offsetComponents.second = Int(r4)
        
        guard let rndDate1 = gregorian.date(byAdding: offsetComponents, to: today) else {
            print("randoming failed")
            return today
        }
        return rndDate1
    }
    
    /// SwiftRandom extension
    public static func random() -> Date {
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        return Date(timeIntervalSince1970: randomTime)
    }
}

public extension Double {
    /// SwiftRandom extension
    public static func random(_ lower: Double = 0, _ upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension Int {
    /// SwiftRandom extension
    public static func random(_ range: Range<Int>) -> Int {
        #if swift(>=3)
            return random(range.lowerBound, range.upperBound - 1)
        #else
            return random(range.upperBound, range.lowerBound)
        #endif
    }
    
    /// SwiftRandom extension
    public static func random(_ range: ClosedRange<Int>) -> Int {
        return random(range.lowerBound, range.upperBound)
    }
    
    /// SwiftRandom extension
    public static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

