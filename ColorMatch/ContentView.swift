//
//  ContentView.swift
//  ColorMatch
//
//  Created by David Paner on 5/2/20.
//  Copyright © 2020 David Paner. All rights reserved.
//

import SwiftUI

//declares the body of ContentView and fills out the contents
struct ContentView: View {

    @State var targetColor = randomColor()
    
    @State var guessColor = ColorObj(r: 0.5, g: 0.5, b: 0.5)
    
    //let UI should update whenever value is changed
    @State var showAlert = false
    
    
    var body: some View {
        //horizontal stack, display our targets side by side
        VStack {
            HStack {
                VStack{
                    Rectangle().foregroundColor(Color(red: targetColor.r, green: targetColor.g, blue: targetColor.b, opacity: 1.0))
                    Text("Match this color")
                }
                VStack {
                    Rectangle().foregroundColor(Color(red: guessColor.r, green: guessColor.g, blue: guessColor.b, opacity: 1.0))
                    HStack {
                        Text("R: \(toHex(val: guessColor.r))")
                        Text("G: \(toHex(val: guessColor.g))")
                        Text("B: \(toHex(val: guessColor.b))")
                    }
                }
            }.padding(.bottom)
            HStack {
                Button(action: {
                    self.targetColor = randomColor()
                    
                           }) {
                               Text("New Color")
                           }
            Button(action: {
                self.showAlert = true
            }) {
                Text("Score Me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text(targetColor.computeCloseness(guess: guessColor)))
            }
            }
            VStack {
                HStack {
                    Text("0")
                    //$ allows us to read from and write to rGuess
                    Slider(value: $guessColor.r).accentColor(.red)
                    Text("255")
                }.padding()
                HStack {
                    Text("0")
                    //$ allows us to read from and write to rGuess
                    Slider(value: $guessColor.g).accentColor(.green)
                    Text("255")
                }.padding()
                HStack {
                    Text("0")
                    //$ allows us to read from and write to rGuess
                    Slider(value: $guessColor.b).accentColor(.blue)
                    Text("255")
                }.padding()
            }
        }
    }
}

//produces a view that contains an instance of ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
