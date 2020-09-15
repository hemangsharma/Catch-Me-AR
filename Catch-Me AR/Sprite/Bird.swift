//
//  Bird.swift
//  CatchMe
//
//  Created by Hemang on 31/05/20.
//  Copyright © 2020 Hemang. All rights reserved.
//

import SpriteKit
import GameplayKit

class Bird : SKSpriteNode {
 
    var mainSprite = SKSpriteNode()
    
    func setup(){
        
        mainSprite = SKSpriteNode(imageNamed: "bird1")
        self.addChild(mainSprite)
        
        let textureAtals = SKTextureAtlas(named: "bird")
        let frames = ["bird_0", "bird_1", "bird_2", "bird_3", "bird_4", "bird_5", "bird_6"].map{textureAtals.textureNamed($0)}
        
        let atlasAnimation = SKAction.animate(with: frames, timePerFrame: 1/7, resize: false, restore: false)
        
        let animationAction = SKAction.repeatForever(atlasAnimation)
        mainSprite.run(animationAction)
        
        
        let left = GKRandomSource.sharedRandom().nextBool()
        if left {
            mainSprite.xScale = -1
        }
        
        let duration = randomNumber(lowerBound: 10, upperBound: 15)
        
        let fade = SKAction.fadeOut(withDuration: TimeInterval(duration))
        let removeBird = SKAction.run {
            NotificationCenter.default.post(name: Notification.Name("Spawn"), object: nil)
            self.removeFromParent()
        }
        
        let flySeqence = SKAction.sequence([fade, removeBird])
        
        mainSprite.run(flySeqence)
        
    }
    
}


