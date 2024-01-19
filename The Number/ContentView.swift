//
//  ContentView.swift
//  The Number
//
//  Created by Supakrit Nithikethkul on 19/1/2567 BE.
//
import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess = "?"
    @State var win = false
    @State var result = "[]"
    @State var startRange = 0
    @State var endRange = 100

    var body: some View {
        VStack {
            // Displaying the count in the top right corner
            HStack {
                Spacer()
                Text("Attempts: \(game.count)")
                    .padding()
            }
            HStack {
                Text("Range")
                TextField("Start Range", value: $startRange, formatter: NumberFormatter())
                Text("-")
                TextField("End Range", value: $endRange, formatter: NumberFormatter())
                Button("Reset") {
                    game.startNewGame(start: startRange, stop: endRange)
                    guess = "?"
                    result = "[?]"
                }
                .padding() // Add padding around the button's text
                .background(Color.green) // Set the background color of the button
                .foregroundColor(.black) // Set the text color of the button
                .cornerRadius(30) // Optional: to round the corners of the button
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            HStack {
                Text("The Number")
                    .frame(width: 120) // Set equal width
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.green)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    )

                Text(result)
                    .frame(width: 30) // Set equal width
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.black)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    )
                TextField("Enter a number", text: $guess)
                    .keyboardType(.numberPad) // Setting keyboard type to number pad
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    )
            }
            
            HStack {
                Button("Guess!") {
                    if let guessNumber = Int(guess) {
                        let resultCheck = game.check(guess: guessNumber)
                        switch resultCheck {
                        case 0:
                            win = true
                        case -1:
                            result = "[>]"
                        case 1:
                            result = "[<]"
                        default:
                            result = "Error, there is something wrong."
                        }
                    }
                }
                .padding() // Add padding around the button's text
                .background(Color.green) // Set the background color of the button
                .foregroundColor(.black) // Set the text color of the button
                .cornerRadius(30) // Optional: to round the corners of the button
            }
            .padding()

        }
        .alert(isPresented: $win) {
            Alert(
                title: Text("You Won!"),
                message: Text("It took you \(game.count) attempts to find \(game.the_number)"),
                dismissButton: .default(Text("OK")) {
                    game.startNewGame(start: startRange, stop: endRange)
                    guess = "?"
                    result = "[?]"
                }
            )
        }
        .background(Color.blue.opacity(0.5))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
