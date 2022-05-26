//
//  ViewController.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game: Concentration = Concentration(number: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount: Int = 0{
        didSet{
            updateFlipCountLabel()
        }
    }
    
 
    func updateFlipCountLabel(){
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attrString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attrString;
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("cardNumber = \(cardNumber)")
            game.chooseCard(cardNumber)
            updateViewFromModel()
        }else{
            print("not exist")
        }
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
//    private var emojiJoices: [String] = ["👻","🎃","😁","🤖","😼","🤝"]
    private var emojiJoices: String = "👻🎃😁🤖😼🤝"

    private var emoji = [Card:String]()
    
    private func emoji(for card: Card)-> String {
        if emoji[card] == nil, emojiJoices.count > 0 {
            let rnd = emojiJoices.index(emojiJoices.startIndex, offsetBy: emojiJoices.count.arc4random)
            emoji[card] = String(emojiJoices.remove(at: rnd))
            }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
            return 0
        }
    }
}
