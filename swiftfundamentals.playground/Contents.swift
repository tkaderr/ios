//: Playground - noun: a place where people can play

import UIKit

struct Card {
    var value: String
    var suit: String
    var numerical_value: Int
    
    func show(){
        print("The card value is \(value) and the suit is \(suit) and the numerical value is \(numerical_value)")
    }
}

class Deck {
    var cards = [Card]()
    init(){
        let value = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suit = ["Clubs","Spades","Diamonds","Hearts"]
        for suits in suit {
            for i in 0...12 {
                let newcard=Card(value:value[i], suit:suits,numerical_value: i+1)
                self.cards.append(newcard)
            }
        }
    }
    
    func deal()-> Card?{
        if self.cards.count>0{
            return self.cards.remove(at: 0)
        }
        else {
            return nil
        }
    }
    
    func reset(){
        let value = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suit = ["Clubs","Spades","Diamonds","Hearts"]
        self.cards = [Card]()
        for suits in suit {
            for i in 0...12 {
                let newcard=Card(value:value[i], suit:suits,numerical_value: i+1)
                self.cards.append(newcard)
            }
        
        }
    }
    
    func shuffle(){
        for i in 0..<self.cards.count{
            let randone=Int(arc4random_uniform(UInt32(self.cards.count)))
            let randtwo=Int(arc4random_uniform(UInt32(self.cards.count)))
            if randone != randtwo {
                swap(&self.cards[randone], &self.cards[randtwo])
            }
        }
    }
    
}

class Player {
    var name: String
    init(name:String){
        self.name = name
    }
    var hand = [Card]()

    func draw(deck:Deck)->Card?{
        if let card = deck.deal(){
            self.hand.append(card)
            return card
        }
        else {
            return nil
        }
    }
    
    func discard(value:String, suit:String)->Bool{
        for i in 0..<self.hand.count{
            if self.hand[i].value == value && self.hand[i].suit == suit {
                self.hand.remove(at:i)
                return true
            }
        }
        return false
    }
    
    func show(){
        for card in self.hand{
            card.show()
        }
    }

}

let newdeck = Deck()
newdeck.shuffle()
newdeck.shuffle()
print(newdeck.cards)
var bill = Player(name: "bill")
bill.draw(deck:newdeck)
bill.draw(deck:newdeck)
bill.show()
