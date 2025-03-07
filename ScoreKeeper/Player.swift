//
//  Player.swift
//  ScoreKeeper
//
//  Created by William De Rocco on 3/7/25.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}
