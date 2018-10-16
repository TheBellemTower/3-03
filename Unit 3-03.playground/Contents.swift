// Created on: Sept-2018
// Created by: Ethan Bellem
// Created for: ICS3U
// program will ask the user for a number between 1 and 3 then compare it with a generated number between 1 and 3
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel : UILabel = UILabel()
    let guessLabel : UILabel = UILabel()
    let answerLabel : UILabel = UILabel()
    let responseLabel : UILabel = UILabel()
    let guessTextField : UITextField = UITextField()
    let calculateButton : UIButton = UIButton()
    let PREDETERMINED_NUMBER : Int = Int(arc4random_uniform(3) + 1)
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Enter 1 for rock, 2 for paper, and 3 for scissors."
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        guessLabel.text = "Enter your choice here:"
        view.addSubview(guessLabel)
        guessLabel.translatesAutoresizingMaskIntoConstraints = false
        guessLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        guessLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        guessTextField.borderStyle = UITextBorderStyle.roundedRect
        guessTextField.placeholder = " Choice "
        view.addSubview(guessTextField)
        guessTextField.translatesAutoresizingMaskIntoConstraints = false
        guessTextField.centerYAnchor.constraint(equalTo: guessLabel.centerYAnchor).isActive = true
        guessTextField.leadingAnchor.constraint(equalTo: guessLabel.trailingAnchor, constant: 10).isActive = true
        
        calculateButton.setTitle("Calcuate", for: UIControlState.normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateResult), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.topAnchor.constraint(equalTo: guessLabel.bottomAnchor, constant: 15).isActive = true
        
        answerLabel.text = "\(PREDETERMINED_NUMBER) is the answer"
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerYAnchor.constraint(equalTo: calculateButton.centerYAnchor).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: calculateButton.trailingAnchor, constant: 20).isActive = true
        
        view.addSubview(responseLabel)
        responseLabel.translatesAutoresizingMaskIntoConstraints = false
        responseLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 10).isActive = true
        responseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    
    @objc func calculateResult() {
        // calculate and show awswer
        
        var computerChoice : String? = nil
        
        if PREDETERMINED_NUMBER == 1 {
             computerChoice = "rock"
        } else if PREDETERMINED_NUMBER == 2 {
             computerChoice = "paper"
        } else if PREDETERMINED_NUMBER == 3 {
             computerChoice = "scissors"
        } else {
             computerChoice = "not working"
        }
        
        if guessTextField.hasText == false {
            responseLabel.text = "Type your choice before clicking calculate"
        } else {
            let guess : Float = Float(guessTextField.text!)!
            
            if guess <= 0.9 || guess >= 3.1 {
                responseLabel.text = "Your choice should be a number between 1 and 3"
                
            } else if guess == Float(PREDETERMINED_NUMBER) {
                responseLabel.text = "You tied."
                
            } else if guess == 1 && PREDETERMINED_NUMBER == 2 || guess == 2 && PREDETERMINED_NUMBER == 3 || guess == 3 && PREDETERMINED_NUMBER == 1 {
                responseLabel.text = "You won! The enemy chose \(computerChoice!)"
                
            } else if guess == 2 && PREDETERMINED_NUMBER == 1 || guess == 3 && PREDETERMINED_NUMBER == 2 || guess == 1 && PREDETERMINED_NUMBER == 3 {
                responseLabel.text = "You lost! The enemy chose \(computerChoice!)"
            }
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
