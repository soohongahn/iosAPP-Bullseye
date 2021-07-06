//
//  ContentView.swift
//  Bullseye
//
//  Created by soohong ahn on 2021/07/02.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var nextRoundPressed = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        let message = "🎯🎯🎯\nPut the Bullseye as close as you can to"
        VStack(spacing: 30){
            //Message
            Text(message.uppercased())
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .font(.footnote)
                .lineSpacing(4.0)
            
            //Target Number
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            
            //Slider
            HStack(spacing: 10){
                Text("1")
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
            }
            .font(.callout)
            .padding()
            
            //HIT ME Button
            Button(action: {
                alertIsVisible = true;
                print("[BTN] HIT ME is pressed.")
            }) {
                Text("HIT ME")
            }
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                let currentScore = game.calcPoint(sliderValue: roundedValue)
                return Alert(
                    title: Text("Result"),
                    message: Text("Your Guess: \(roundedValue)\n" + "SCORE: \(currentScore)"),
                    primaryButton: .default(Text("Next Round")) {game.update(currentScore: currentScore, currentRound: game.round)},
                    secondaryButton: .destructive(Text("Close"))
                    )
                
            })
            
            //Reset
            Button(action: {
                game.reset()
                sliderValue = 50.0
            }) {
                Text("RESET")
            }
            
            //Score and Round
            HStack{
                Text("SCORE: ")
                Text(String(game.score))
                    .fontWeight(.black)
                Spacer()
                Text("ROUND: ")
                Text(String(game.round))
                    .fontWeight(.black)
            }
            .padding()
            .font(.subheadline)
            
        }//VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
