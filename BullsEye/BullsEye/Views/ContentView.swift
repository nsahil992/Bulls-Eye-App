//
//  ContentView.swift
//  BullsEye
//
//  Created by Sahil on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULL'S EYE AS CLOSE AS YOU CAN")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(2.0)
                .font(.footnote)
                .kerning(3.0)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("HIT ME") {
                alertIsVisible = true
            }
            .alert("Button Pressed",
                   isPresented: $alertIsVisible,
                   actions: {
                Button("Cancel"){
                    
                }
            },
                   message: {
                let roundedValue = Int(sliderValue)
                Text("""
                     The slider's value is \(roundedValue).
                     You scored \(game.points(sliderValue: roundedValue)) in this round.
                     """)
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
