//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Derya Antonelli on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    let tools = ["Rock", "Paper", "Scissors"]
    @State var selected = Int.random(in: 0..<3)
    @State var isWinner = Bool.random()
    @State var output = "No selection made"
    
    var body: some View {
        VStack{
            Button(tools[selected]) {}
            Text(isWinner ? "Win" : "Lose")
            
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
        }

    }
    
    func selectTool(_ tool: String) {
        output = "You've selected \(tool)"
        selected = Int.random(in: 0..<3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
