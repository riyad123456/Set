//
//  Card.swift
//  Set
//
//  Created by Mac on 7/2/20.
//  Copyright © 2020 Riyad-IOS. All rights reserved.
//

import Foundation
struct Card{
    var shape:Shape?
    var color:Color?
    var shading:Shading?
    var numberofElements: NumberofElements?
    var shouldDisappear = false
    init(shape: Shape,color: Color,numberofElements:NumberofElements, shading: Shading){
        self.shape = shape
        self.color = color
        self.shading = shading
        self.numberofElements = numberofElements
    }
    static func doFormSetOfThree(first: Card, second: Card, third: Card) -> Bool {
        let colorsMatch = Color.allIdenticalOrAllDistinct(first: first.color!, second: second.color!, third: third.color!)
        let numbersMatch = NumberofElements.allIdenticalOrAllDistinct(first: first.numberofElements!, second: second.numberofElements!, third: third.numberofElements!)
        let shapesMatch = Shape.allIdenticalOrAllDistinct(first: first.shape!, second: second.shape!, third: third.shape!)
        let shadingsMatch = Shading.allIdenticalOrAllDistinct(first: first.shading!, second: second.shading!, third: third.shading!)
        
        return colorsMatch && numbersMatch && shapesMatch && shadingsMatch
    }
}
extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return
            lhs.shape == rhs.shape &&
            lhs.color == rhs.color &&
            lhs.shading == rhs.shading &&
            lhs.numberofElements == rhs.numberofElements
    }
}

