//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by William De Rocco on 3/7/25.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]

    var state = GameState.setup
    var doesHighestScoreWin = true

    // If game is ongoing, winners is empty, otherwise retrun highest/lowest scorer
    var winners: [Player] {
        guard state == .gameOver else { return [] }

        var winningScore: Int

        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }

        return players.filter { player in
            return player.score == winningScore
        }
    }

    /// Declare `resetScores` method (use `mutating` keyword to indicate that this method on the struct can alter data)
    /// For testing, we use an empty function (least amount of working code = best)
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
