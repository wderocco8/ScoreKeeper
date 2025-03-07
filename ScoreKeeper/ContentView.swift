//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by William De Rocco on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]

    var body: some View {
        VStack {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)

            ScrollView {
                Grid(alignment: .leading) {
                    // Header row
                    GridRow {
                        Text("Player")
                            .bold()
                            .frame(width: 150, alignment: .leading)
                        Text("Score")
                            .bold()
                            .frame(width: 50)
                        Text("")  // Placeholder for Stepper column
                    }
                    .font(.headline)
                    .padding(.bottom, 5)
                    

                    Divider()

                    // Content rows
                    ForEach($players) { $player in
                        GridRow {
                            TextField("Name", text: $player.name)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 150)

                            Text("\(player.score)")
                                .frame(width: 50, alignment: .center)

                            Stepper("", value: $player.score)
                                .labelsHidden()
                        }
                        .padding(.vertical, 5)

                        Divider()
                    }
                    
                }
            }

            Button("Add player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
