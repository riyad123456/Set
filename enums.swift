//
//  enums.swift
//  Set
//
//  Created by Mac on 7/4/20.
//  Copyright © 2020 Riyad-IOS. All rights reserved.
//

import Foundation
import UIKit
enum NumberofElements:TripleComparable{
    case one
    case two
    case three
    mutating func getnumberofElements() -> Int {
        switch self{
            case .one : return 1
            case .two :return 2
            case .three : return 3
        }
    }
}
enum Shape:TripleComparable{
    case diamond
    case circle
    case square
    mutating func getShape() -> String{
        switch self{
            case .diamond : return "▲"
            case .circle :return "◼︎"
            case .square : return "●"
        }
    }
}
enum Color:TripleComparable{
    case red
    case blue
    case green
    mutating func getColor() -> UIColor{
        switch self{
        case .red : return UIColor.red
        case .blue :return UIColor.blue
        case .green : return UIColor.green
        }
    }
}
enum Shading:TripleComparable{
    case stripped
    case filled
    case outline
}
    



