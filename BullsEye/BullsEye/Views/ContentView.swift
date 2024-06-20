//
//  ContentView.swift
//  BullsEye
//
//  Created by Sahil on 16/06/24.
//


// For dark mode, add a color to your asset.
import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                InstructionView(game: $game)
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
                Button("Hit me".uppercased()) {
                    alertIsVisible = true
                }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                            startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(.white)
                .cornerRadius(21.0)
                .bold()
                .font(.title3)
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
    struct InstructionView: View {
        @Binding var game: Game
        var body: some View {
            VStack {
                InstructionText(text: "🎯🎯🎯\nPut the bull's eye as close as you can")
                    .padding(.horizontal, 30)
                BigNumberText(text: String(game.target))
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
