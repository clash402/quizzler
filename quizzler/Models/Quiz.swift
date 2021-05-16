//
//  Quiz.swift
//  quizzler
//
//  Created by Josh Courtney on 4/25/21.
//

import Foundation

struct Quiz {
    let questions = [
        Question(text: "A", answer: "True"),
        Question(text: "B", answer: "True"),
        Question(text: "C", answer: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func incrementQuestion() {
        if questionNumber < questions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func answerIsCorrect(_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionNumber].answer {
            updateScore()
            
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return questions[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(questions.count)
    }
    
    mutating func updateScore() {
        score += 1
    }
    
    func getScore() -> Int {
        return score
    }
}
