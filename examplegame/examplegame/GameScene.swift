//
//  GameScene.swift
//  examplegame
//
//  Created by Tahim Kader on 5/12/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    
    let manager = CMMotionManager()
    
    
    override func didMove(to view: SKView) {
        
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        
        
      
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
