//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight
        {
            sender.backgroundColor = UIColor.green
            print("Correct Answer") // This Prints when User Got the Right Answer
        }
        else{
            sender.backgroundColor = UIColor.red
            print("Wrong Answer") // This comes when User Choose's the wrong Answer
        }
        
        quizBrain.newQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)// This Is A scheduler for Updating UI and all its Functionalities after choosing option from all the options.
        
    }
    
    @objc func updateUI(){
        
        
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let answerChoice = quizBrain.getAnswerChoice()
        option1.setTitle(answerChoice[0], for: .normal)
        option2.setTitle(answerChoice[1], for: .normal)
        option3.setTitle(answerChoice[2], for: .normal)
       
        option1.backgroundColor = UIColor.clear // This here is used to clear the button color once choosed as it dont want to retain the color i.e either Green or Red after right or wrong answer respectively.
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        
        
        
        
    }
    
}

