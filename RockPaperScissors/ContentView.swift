//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Derya Antonelli on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var winnerMove = "None"

    @State private var selected = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var output = "No selection made"
    
    var body: some View {
        VStack{
            Text(moves[selected])
            Text(shouldWin ? "Win" : "Lose")
            
            HStack {
                Button("Rock") {
                    selectTool("Rock")
                }
                Button("Paper") {
                    selectTool("Paper")
                }
                Button("Scissors") {
                    selectTool("Scissors")
                }
            }
            
            Text("Your score")
            Text("0")
            Text(output)
            Text(winnerMove)
        }

    }
    
    func selectTool(_ tool: String) {
        output = "You've selected \(tool)"
        var winningMoves = beating(moves: moves)
        winnerMove = winningMoves[selected]
    }
    
    func beating(moves: Array<String>) -> Array<String> {
        var result: [String] = []
        moves.forEach { move in
            if(move == "Rock") {
                result.append("Paper")
            }
            else if(move == "Paper") {
                result.append("Scissors")
            }
            else if(move == "Scissors") {
                result.append("Rock")
            }
        }
        return result
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
