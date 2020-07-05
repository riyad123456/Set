//
//  Set.swift
//  Set
//
//  Created by Mac on 7/2/20.
//  Copyright © 2020 Riyad-IOS. All rights reserved.
//
import Foundation
struct Set{
    var deckOfCards = [Card]()
    var cardsAlreadyMatched = [Card]()
    var ThreeCardsPlayed = [Card]()
    var cardsOnScreen = [Card]()
    var shapes = [Shape.circle,Shape.square,Shape.diamond]
    var colors = [Color.red,Color.blue,Color.green]
    var shadings = [ Shading.filled,Shading.stripped,Shading.outline]
    var numbers = [ NumberofElements.one,NumberofElements.two,NumberofElements.three]
    init(){
        var card: Card?
        for i in shapes.indices{
            for j in shapes.indices{
                for x in shapes.indices{
                    for y in shapes.indices{
                            card = Card(shape: shapes[i], color: colors[j], numberofElements: numbers[x], shading: shadings[y])
                        deckOfCards.append(card!)
                    }
                }
            }
        }
        deckOfCards.shuffle()
        for _ in 0...11{
            cardsOnScreen.append(deckOfCards.removeLast())
        }
    }
    mutating func selectCard(at index: Int){
    
        let card = cardsOnScreen[index]
        if !cardsAlreadyMatched.contains(card){
            if !ThreeCardsPlayed.contains(card){
                ThreeCardsPlayed.append(card)
            }
                
            else {
                let index = ThreeCardsPlayed.firstIndex(of: card)
                ThreeCardsPlayed.remove(at: index!)
            }
        }
  
        if ThreeCardsPlayed.count == 3 {
            let first = ThreeCardsPlayed[0]
            let second = ThreeCardsPlayed[1]
            let third = ThreeCardsPlayed[2]
            if Card.doFormSetOfThree(first: first, second: second, third: third) {
                cardsAlreadyMatched.append(first)
                cardsAlreadyMatched.append(second)
                cardsAlreadyMatched.append(third)
                
        }
            ThreeCardsPlayed.removeAll()
        }
      

}
    mutating func dealThreeMoreCardsFromModel(){
            
            if cardsOnScreen.count < 24 {
               if !deckOfCards.isEmpty{
                for _ in 1...3{
                cardsOnScreen.append(deckOfCards.removeLast())
            }
                }
                } else {
                if !deckOfCards.isEmpty{
                    if cardsAlreadyMatched.count >= 3 {
                    for index in 0...2{
                        let cardToCopy = deckOfCards.removeLast()
                        let cardToChange = cardsAlreadyMatched[index]
                        let spot = cardsOnScreen.firstIndex(of: cardToChange)
                        cardsOnScreen[spot!] = cardToCopy
                    }
                    for _ in 0...2{
                        cardsAlreadyMatched.removeFirst()
                    }
                  }
                }
            }
    }
    mutating func dealThreeMoreCardsFromModelCaseDeckEmpty(){
        print(cardsAlreadyMatched.count)
        if cardsAlreadyMatched.count >= 3 {
                for index in 0...2{
                    let cardToDelete = cardsAlreadyMatched[index]
                    let spot = cardsOnScreen.firstIndex(of: cardToDelete)
                    cardsOnScreen[spot!].shouldDisappear = true
                }
            for _ in 0...2{
                cardsAlreadyMatched.removeFirst()
                }
            }
        print(cardsAlreadyMatched.count)
        print(cardsOnScreen.count)
        }
    }




