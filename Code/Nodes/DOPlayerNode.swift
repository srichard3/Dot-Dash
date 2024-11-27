//
//  DOPlayerNode.swift, essentially a larger player
//  Dot-Dash
//
//  Created by Zhaorong Tu on 11/4/24.
//
/*
import SpriteKit

class DOPlayerNode: SKSpriteNode {
    let scale = 0.1
    var gridPosition: CGPoint
    var gridX: Int
    var gridY: Int
    
    init(radius: CGFloat = 30, position: CGPoint = .zero, gridPosition: CGPoint = .zero) {
        self.gridPosition = gridPosition
        self.gridX = Int(gridPosition.x)
        self.gridY = Int(gridPosition.y)
        
        // Load texture from Assets folder
        let texture = SKTexture(imageNamed: "thin_full")
        let size = CGSize(width: texture.size().width * scale, height: texture.size().height * scale) // Scale size if needed
        
        // Call the designated initializer
        super.init(texture: texture, color: .clear, size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Set initial position
        self.position = position
        
        // Physics for collision detection
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.isDynamic = false // Disable gravity
        self.physicsBody?.categoryBitMask = 0x1 << 2
        self.physicsBody?.contactTestBitMask = 0x1 << 2
        self.physicsBody?.collisionBitMask = 0x1 << 2
    }
    
    func getLoc() -> (Int, Int){
        return (gridX,gridY)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
*/

import SpriteKit

class DOPlayerNode: DODotNode {
    var gridPosition: CGPoint
    override init(radius: CGFloat = 30, position: CGPoint = .zero, gridPosition: CGPoint = .zero) {
      
        self.gridPosition = gridPosition
        super.init(position: position , gridPosition: gridPosition)
        
        // create a circle
        self.path = CGPath(ellipseIn: CGRect(x: -radius, y: -radius, width: radius * 0.5, height: radius * 0.5), transform: nil)
        
        self.fillColor = .white

        self.fillTexture = SKTexture(imageNamed: "open")
        
        // physics for collision detection
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.isDynamic = false // disable gravity
        self.physicsBody?.categoryBitMask = 0x1 << 2 // category (key) for the player
        
        // TODO: can be updated (or not use bitmasks altogether) to detect collision with other categories
        self.physicsBody?.contactTestBitMask = 0x1 << 2 // detect collision with another category
        self.physicsBody?.collisionBitMask = 0x1 << 2 // collide with the other category
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
