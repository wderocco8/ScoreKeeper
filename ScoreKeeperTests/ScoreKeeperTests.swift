//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by William De Rocco on 3/7/25.
//

import Testing

@testable import ScoreKeeper

struct ScoreKeeperTests {

    /// Each argument `[0, 10, 20]` represents a distinct test that will be applied
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        // initialize data
        var scoreboard = Scoreboard(players: [
            Player(name: "Alice", score: 0),
            Player(name: "Andre", score: 5),
        ])

        // perform resetScores action
        scoreboard.resetScores(to: newValue)

        // verify that state matches expected state
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }

    @Test("Highest score wins")
    func highestScoreWins() async throws {
        // initialize data
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Alice", score: 0),
                Player(name: "Andre", score: 5),
            ],
            state: .gameOver,
            doesHighestScoreWin: true)

        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 5)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() async throws {
        // initialize data
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Alice", score: 0),
                Player(name: "Andre", score: 5),
            ],
            state: .gameOver,
            doesHighestScoreWin: false)

        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Alice", score: 0)])
    }
}
