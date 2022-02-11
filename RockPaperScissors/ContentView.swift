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
    @State private var numberOfQuestions = 10;
    @State private var isGameOver = false;
    @State private var computerMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var userMove = "❓"
    @State private var output = "Let's Play"
    
    var body: some View {
        ZStack {
            Color.yellow
            .ignoresSafeArea()
       
        VStack{
//            Text(output)
//                    .font(.title)
                Text("Total Score: \(score)")
                .font(.title3)
                .frame(minWidth: 0, maxWidth: .infinity,minHeight:0, maxHeight: 0 ,alignment: .topLeading)
                .padding(.top)
                .padding(.leading)
            
            VStack() {
                Text(moves[computerMove]);
                Text(shouldWin ? "Win" : "Lose")
                    .font(.title)
//                Text(userMove)
            }
                
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
            Spacer()
        }
        .alert("Game Over", isPresented: $isGameOver) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your total score is \(score)")
        }
    }
    }
    
    func selectMove(_ move: String) {
        userMove = move;
        if(shouldWin && move == winningMoves[computerMove] || !shouldWin && move == losingMoves[computerMove]) {
            output = "Ooo wow congrats!"
            score += 1
        } else {
            output = "Dang! Wrong answer"
            score -= 1
        }
        
        shuffle()
        numberOfQuestions -= 1
        
        if(numberOfQuestions == 0) {
            isGameOver = true;
            return
        }
    }
    

    func shuffle() {
        computerMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    func restartGame() {
        score = 0
        numberOfQuestions = 10
        output = "Let's play"
        userMove = "❓"
        shuffle()
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
