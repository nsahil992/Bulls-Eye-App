//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Sahil on 16/06/24.
//

import XCTest
@testable import BullsEye

final class BullsEyeTests: XCTestCase {
    var game: Game!
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
        
        func testScoreNegative() {
            let guess = game.target - 5
            let score = game.points(sliderValue: guess)
            XCTAssertEqual(score, 95)
        }
        
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
}
