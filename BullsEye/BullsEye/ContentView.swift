//
//  ContentView.swift
//  BullsEye
//
//  Created by Sahil on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULL'S EYE AS CLOSE AS YOU CAN")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(2.0)
                .font(.footnote)
                .kerning(3.0)
            Text("89")
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
                Text("This is my first alert")
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
