//
//  Concentration.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import Foundation

class Concentration {
    private(set) var cards =  [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(number: Int) {
        assert(number > 0, "[Concentration].chooseCard: Incorrect number")
        for _ in 1...number {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func chooseCard(_ index: Int){
        assert(cards.indices.contains(index), "[Concentration].chooseCard: Incorrect index")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
