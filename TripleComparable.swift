//
//  TripleComparable.swift
//  Set
//
//  Created by Mac on 7/4/20.
//  Copyright © 2020 Riyad-IOS. All rights reserved.
//

import Foundation

protocol TripleComparable: Equatable {
    static func allIdentical(first: Self, second: Self, third: Self) -> Bool
    static func allDistinct(first: Self, second: Self, third: Self) -> Bool
    static func allIdenticalOrAllDistinct(first: Self, second: Self, third: Self) -> Bool
}

extension TripleComparable {
    static func allIdentical(first: Self, second: Self, third: Self) -> Bool {
        return first == second && second == third && first == third
    }
    static func allDistinct(first: Self, second: Self, third: Self) -> Bool {
        return first != second && second != third && first != third
    }
    
    static func allIdenticalOrAllDistinct(first: Self, second: Self, third: Self) -> Bool {
        return allIdentical(first: first, second: second, third: third) || allDistinct(first: first, second: second, third: third)
    }
}
