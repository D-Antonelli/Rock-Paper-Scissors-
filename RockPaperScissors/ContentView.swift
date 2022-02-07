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
    
    @State private var score = 0

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
            
            Text(output)
            Text("Your score is \(score)")
        }

    }
    
    func selectMove(_ move: String) {
        if(shouldWin && move == winningMoves[selected] || !shouldWin && move == losingMoves[selected]) {
            output = "Ooo wow congrats!"
            score += 5
        } else {
            output = "Dang! Wrong answer"
            score -= 5
        }
        
        shuffle()
    }
    


func shuffle() {
    selected = Int.random(in: 0..<3)
    shouldWin = Bool.random()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
