//: Playground - noun: a place where people can play

import UIKit


class Animal{
    var name:String
    var health: Int
    init(name:String){
        self.name = name
        self.health = 100
    }
    
    func displayHealth(){
        print("Health = \(self.health)")
    }
}

class Cat: Animal {
    init(catname: String) {
        super.init(name: catname)
    }
    
    func growl(){
        print("Rawr!")
        self.health = 150
    }
    
    func run(){
        print("Running")
        self.health -= 10
    }
}

class Cheetah: Cat {
    init(cheetahname: String) {
        super.init(catname: cheetahname)
    }
    
    override func run(){
        print("Running Fast")
        self.health -= 50
    }
    
    func sleep(){
        if self.health <= 200 {
            self.health += 50
        }
        else {
            print("Health is above 200")
        }
    }
}

class Lion: Cat {

    init(lionname: String){
        super.init(catname:lionname)
        self.health = 200
    }
    override func growl() {
        print("ROAR!!! I am King")
    }
}

var coolcat = Cheetah(cheetahname: "cheetah")
coolcat.run()
coolcat.run()
coolcat.run()
coolcat.run()
coolcat.displayHealth()

var coolion = Lion(lionname: "lionas")
coolion.run()
coolion.run()
coolion.run()
coolion.growl()
coolion.displayHealth()
















