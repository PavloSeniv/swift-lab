//
//  Card.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import Foundation

struct Card : Hashable {
    var hashValue: Int {return identifier}
    
    static func ==(lsh: Card, rhs: Card) ->  Bool{
        return lsh.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var idFactory = 0
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init(){
        self.identifier = Card.getUniqueId()
    }
    
}
