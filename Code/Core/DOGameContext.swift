//
//  DOGameContext.swift
//  Dot-Dash
//
//  Created by Zhaorong Tu on 11/1/24.
//

import Foundation
import CoreGraphics
import GameplayKit

public class DOGameContext {
    static let shared = DOGameContext()  // singleton instance
    private(set) var scene: DOGameScene!
    private(set) var stateMachine: GKStateMachine?  // needed to manage states
    var gameInfo = DOGameInfo()
    // define parameters for the grid, which will track positions of DODotNodes
    var grid: [[Bool]]
    let gridSize = 13
    let dotSpacing: CGFloat = 35  // space between dots for layout on screen, remove hardcode later

    // initialize array to be of size gridSize x gridSize
    init() {
        grid = Array(repeating: Array(repeating: false, count: gridSize+2), count: gridSize+2)
    }

    // function to get a random grid position
    // TODO: update to avoid placing dots on top of each other
    func getRandomPosition() -> (Int, Int) {
        let i = Int.random(in: 1..<gridSize+1)
        let j = Int.random(in: 1..<gridSize+1)
        return (i, j)
    }
}
