//
//  GameScene.swift
//  space
//
//  Created by Tahim Kader on 5/30/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    var gameTimer:Timer!
    var scorelabel:SKLabelNode!
    var score:Int = 0 {
        didSet {
            scorelabel.text = "Score: \(score)"
        }
    }
    var possibleAliens = ["alien", "alien2", "alien3"]
    
    var alienCategory:UInt32 = 0x1 << 1
    
    override func didMove(to view: SKView) {
        
        player = SKSpriteNode(imageNamed: "shuttle")
        player.position = CGPoint(x: self.frame.size.width / 2, y: player.size.height / 2)
        self.addChild(player)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        scorelabel = SKLabelNode(text: "Score: 0")
        scorelabel.position = CGPoint(x: 100, y: self.frame.size.height - 60)
        scorelabel.fontSize = 36
        scorelabel.fontColor = UIColor.white
        scorelabel.fontName = "AmericanTypewriter-Bold"
        score = 0
        self.addChild(scorelabel)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)

    }
    
    func addAlien () {
        possibleAliens = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleAliens) as! [String]
        let alien = SKSpriteNode(imageNamed: possibleAliens[0])
        let randomAlienPosition = GKRandomDistribution(lowestValue: 0, highestValue: 414)
        
        let position = CGFloat(randomAlienPosition.nextInt())
        
        alien.position = CGPoint(x: position, y: self.frame.size.height + alien.size.height)
        alien.physicsBody = SKPhysicsBody(rectangleOf: alien.size)
        alien.physicsBody?.isDynamic = true
        
    }
    
    

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
