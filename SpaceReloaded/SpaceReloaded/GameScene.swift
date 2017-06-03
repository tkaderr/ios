//
//  GameScene.swift
//  SpaceReloaded
//
//  Created by Tahim Kader on 5/30/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    
    
    
    override func didMove(to view: SKView) {
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 1472)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "shuttle")
        player.position = CGPoint(x: self.frame.size.width / 2, y: self.size.height / 2)
        self.addChild(player)
    }
    
    

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
