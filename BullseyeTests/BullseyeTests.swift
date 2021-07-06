//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by soohong ahn on 2021/07/02.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.calcPoint(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.calcPoint(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreExact() {
        let guess = game.target
        let score = game.calcPoint(sliderValue: guess)
        XCTAssertEqual(score, 100)
    }
}
