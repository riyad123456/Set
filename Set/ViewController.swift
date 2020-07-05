//
//  ViewController.swift
//  Set
//
//  Created by Mac on 7/2/20.
//  Copyright © 2020 Riyad-IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var setGame = Set()
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func dealThreeMoreCards(_ sender: UIButton) {
        if !setGame.deckOfCards.isEmpty {
            setGame.dealThreeMoreCardsFromModel()
            updateViewFromModel()
            draw()
       } else {
            setGame.dealThreeMoreCardsFromModelCaseDeckEmpty()
            updateViewFromModel()
            draw()
            }
    }
    @IBAction func selectCard(_ sender: UIButton) {
        let cardnumber = cardButtons.firstIndex(of: sender)!
        setGame.selectCard(at: cardnumber)
        updateViewFromModel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        draw()
    }
    func updateViewFromModel(){
        for index in setGame.cardsOnScreen.indices{
        let button = cardButtons[index]
        let card = setGame.cardsOnScreen[index]
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            if setGame.ThreeCardsPlayed.contains(card) || setGame.cardsAlreadyMatched.contains(card){
                button.layer.borderWidth = 1.0
                button.layer.borderColor = UIColor.red.cgColor
                button.layer.cornerRadius = 8.0
                button.layer.shadowColor = UIColor.black.cgColor
                button.layer.shadowOffset = CGSize(width: 2, height: 2)
                button.layer.shadowRadius = 5
                button.layer.shadowOpacity = 1.0
            }
            else {
                button.layer.borderWidth = 0
                button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                button.layer.cornerRadius = 0
                button.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                button.layer.shadowOffset = CGSize(width: 0, height: 0)
                button.layer.shadowRadius = 0
                button.layer.shadowOpacity = 0
            }
    }
}
    func draw(){
        for index in setGame.cardsOnScreen.indices {
                let shape = setGame.cardsOnScreen[index].shape?.getShape() ?? ""
                let color = setGame.cardsOnScreen[index].color?.getColor()
                let number = setGame.cardsOnScreen[index].numberofElements?.getnumberofElements()
                let shading = setGame.cardsOnScreen[index].shading
                let button = cardButtons[index]
                let string = String(repeating: shape+"\n" , count: number!)
                var attributes: [NSAttributedString.Key: Any] = [
                    .strokeWidth: -3,
                    .strokeColor: color!,
                    .foregroundColor: color!,
                    .font:UIFont.systemFont(ofSize: 25)
                ]
                switch shading {
                case .filled:
                    break
                case .outline:
                    attributes[.foregroundColor] = color!.withAlphaComponent(0)
                case .stripped:
                    attributes[.foregroundColor] = color!.withAlphaComponent(0.25)
                case .none:
                    break
            }
                let x = NSAttributedString(string : string, attributes: attributes)
                button.setAttributedTitle(x, for: UIControl.State.normal)
            }
        if setGame.cardsOnScreen.count < 24{
            for index in setGame.cardsOnScreen.count...23{
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
        }
        for index in setGame.cardsOnScreen.indices{
            if setGame.cardsOnScreen[index].shouldDisappear {
                cardButtons[index].isHidden = true
                }
        }
            
    }
}
