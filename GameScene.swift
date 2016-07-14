//
//  GameScene.swift
//  AirMagic
//
//  Created by Nick Delitski on 7/13/16.
//  Copyright (c) 2016 Nick Delitski. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
//       self.physicsWorld.gravity
        let platform = SKShapeNode(path:
            CGPathCreateWithRect(CGRect(x: 0, y: 0, width: self.frame.width, height: 20), nil)
        )
        
        platform.strokeColor = SKColor.blueColor()
//        
        platform.physicsBody = SKPhysicsBody(polygonFromPath: platform.path!)
        platform.physicsBody?.dynamic = false
        self.addChild(platform);
        platform.position = CGPoint(x: 0, y: 0)
    }
    
    func generateCircle(posX: CGFloat, posY: CGFloat) {
        let circleNode = Circle()
        circleNode.position = CGPoint(x: posX, y: posY)
        self.addChild(circleNode);
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self);
            self.generateCircle(location.x, posY: location.y);
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        
    }
}

class Circle: SKShapeNode {
    override init() {
        super.init();
        let diameter = 60
        self.strokeColor = SKColor.redColor()
        self.path = CGPathCreateWithEllipseInRect(CGRect(origin: CGPoint(x: -diameter/2, y: -diameter/2), size: CGSize(width: diameter, height: diameter)), nil)
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter/2));
        self.physicsBody?.dynamic = true
//        self.startBounceAnimation()
    }
    
    func startBounceAnimation() {
        self.runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.scaleBy(2.0, duration: 0.5),
                SKAction.scaleBy(0.5, duration: 0.5)
                ]
            ))
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}