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
            BackgroundView(game: $game)
            
            VStack {
                InstructionView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
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
    
    
    struct SliderView: View {
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack {
                SliderLabelText(text: "1")
                    .frame(width: 35)
                Slider(value: $sliderValue, in: 1.0...100.0)
                SliderLabelText(text: "100")
                    .frame(width: 35)
            }
            .padding()
        }
    }
    
    
    
    struct HitMeButton: View {
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        @Binding var game: Game
        
        var body: some View {
            Button("Hit me".uppercased()) {
                alertIsVisible = true
                game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
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
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color.white, lineWidth: 2.0)
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
    
    
    struct contentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 14 Pro Max")
        }
}
