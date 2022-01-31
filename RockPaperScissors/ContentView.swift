//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Derya Antonelli on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    let tools = ["Rock", "Paper", "Scissors"]
    var selected = Int.random(in: 0..<3)
    var win = Bool.random()
    
    var body: some View {
        VStack{
            Button(tools[selected]) {}
            Text(win ? "Win" : "Lose")
            
            HStack {
                Button("Rock") {}
                Button("Paper") {}
                Button("Scissors") {}
            }
            
            Text("Your score")
            Text("0")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
