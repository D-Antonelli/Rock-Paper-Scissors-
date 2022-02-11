//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Derya Antonelli on 31/01/2022.
//

import SwiftUI

struct MoveButton: View {
    var move: String
    let action: (_ move: String) -> Void
    
    var body: some View {
        Button() {
            action(move)
        }
        label: {
            Image(move)
                .resizable()
                .scaledToFit()
        }
        .frame(width: 60, height: 60, alignment: .center)
    }
}


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
       
            VStack {
//            Text(output)
                HStack {
                    Text("Total Score: \(score)")
                                    .font(.title3)
                }                                    .frame(minWidth: 0, maxWidth: .infinity,minHeight:0, maxHeight: 30 ,alignment: .topLeading)
                
                
                HStack {
                    Text(output)
                        .font(.largeTitle)
                }
                .frame(minWidth: 0, maxWidth: .infinity,minHeight:0, maxHeight: 100 ,alignment: .center)
                
            
                VStack() {
                GeometryReader { geo in
                    Image(moves[computerMove])
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6)
                        .frame(width: geo.size.width, height: geo.size.height)
                }
                Text(shouldWin ? "WIN" : "LOSE")
                    .font(.largeTitle)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400, alignment: .center)
            
                Spacer()
                HStack(spacing: 40) {
                    ForEach(moves, id: \.self) {
                        MoveButton(move: $0) { move in
                            selectMove(move) }
                    }
            }
            Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding()
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
            output = "Good move!"
            score += 1
        } else {
            output = "Dang!"
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
