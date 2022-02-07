//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Derya Antonelli on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    let losingMoves = ["Scissors", "Rock", "Paper"]
    
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
                    selectMove("Rock")
                }
                Button("Paper") {
                    selectMove("Paper")
                }
                Button("Scissors") {
                    selectMove("Scissors")
                }
            }
            
            Text("Your score")
            Text("0")
            Text(output)
            Text(winnerMove)
        }

    }
    
    func selectMove(_ move: String) {
        if(shouldWin && move == winningMoves[selected] || !shouldWin && move == losingMoves[selected]) {
            output = "Ooo wow congrats!"
        } else {
            output = "Dang! Wrong answer"
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
