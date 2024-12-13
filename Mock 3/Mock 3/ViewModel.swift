//
//  ViewModel.swift
//  Mock 3
//
//  Created by Akila Gamage on 2024-11-26.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @AppStorage("fontSize") var fontSize: Double = 16.00
    @AppStorage("selectedColor") var selectedColor: String = "Ruby"
    
    @Published var correctAnswer: String = ""
    @Published var submittedAnswer: String = ""
    @Published var isSubmitted: Bool = false
    @Published var isCorrect: Bool = false
    @Published var score: Int = 0
    @Published var randomNumber1: Int = Int.random(in: 0...10)
    @Published var randomNumber2: Int = 0
    @Published var randomOperator: String = ""
    
    func RandomNumberGenerator(){
        randomNumber1 = Int.random(in: 0...10)
        randomNumber2 = Int.random(in: 0...10)
    }
    
    func RandomOperatorGenerator() {
        if randomNumber2 == 0 {
            // Filter out the division operator
            let randomOperatorArr: [Operator] = Operator.allCases.filter { $0 != .divide }
            
            // Safely get a random operator from the filtered array
            if let tempRandomOperator = randomOperatorArr.randomElement() {
                randomOperator = tempRandomOperator.rawValue
            }
        } else {
            // If randomNumber2 is not 0, use all operators
            if let tempRandomOperator = Operator.allCases.randomElement() {
                randomOperator = tempRandomOperator.rawValue
            }
        }
    }

    func CheckAnswer() {
        if (randomOperator == "+"){
            correctAnswer = String(randomNumber1 + randomNumber2)
        }
        if (randomOperator == "-"){
            correctAnswer = String(randomNumber1 - randomNumber2)
        }
        if (randomOperator == "*"){
            correctAnswer = String(randomNumber1 * randomNumber2)
        }
        if (randomOperator == "/"){
            correctAnswer = String(randomNumber1 / randomNumber2)
        }
        ScoreAllocation()
    }
    
    func ScoreAllocation(){
        if correctAnswer == submittedAnswer{
            isCorrect = true
            if score < 10{
                score += 1
            }
        }
        if correctAnswer != submittedAnswer{
            isCorrect = false
            if score > 0{
                score -= 1
            }
        }
    }
    
    func onClickNext(){
        if isSubmitted{
            if isCorrect{
                RandomNumberGenerator()
                RandomOperatorGenerator()
            }
        }
        if !isSubmitted{
            if score > 0{
                score -= 1
            }
        }
        submittedAnswer = ""
        isSubmitted = false
    }
}
