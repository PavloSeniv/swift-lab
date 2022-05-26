//
//  ViewController.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
    var flipCount: Int = 0 {
            didSet {
                flipCountLabel.text = "Flips: \(flipCount)"
            }
        }
        
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            print("cardNumber = \(cardNumber)")
            flipCard(emojiJoices[cardNumber], sender)
        }else{
            print("not exist")
        }
    }
    
    var emojiJoices: [String] = ["👻","🎃","👻","🎃"]
    
    func flipCard(_ emoji: String, _ button: UIButton){
            if button.currentTitle == emoji {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } else {
                button.setTitle(emoji, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
}

