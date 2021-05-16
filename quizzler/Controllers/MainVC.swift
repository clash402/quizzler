//
//  MainVC.swift
//  quizzler
//
//  Created by Josh Courtney on 4/24/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        checkAnswer(with: sender)
        quiz.incrementQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { timer in
            self.updateUI()
        }
    }
    
    func checkAnswer(with sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        
        if quiz.answerIsCorrect(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quiz.getScore())"
        questionLabel.text = quiz.getQuestionText()
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        
        progressView.progress = quiz.getProgress()
    }
    
}
