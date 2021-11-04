//
//  ResultViewController.swift
//  QuizzicalQuiz
//
//  Created by Andrey Khakimov on 03.11.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answersChosen: [Answer]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        print(answersChosen!)
        resultLabel.text = "Вы - \(calculateAnimal(from: answersChosen))"
        resultDescriptionLabel.text = Animal.init(rawValue: calculateAnimal(from: answersChosen))?.definition
    }
    
}

extension ResultViewController {
   private func calculateAnimal(from answers: [Answer]) -> Animal.RawValue {
        let animals = answers.map { $0.animal }
        
        var dogPoints = 0
        var catPoints = 0
        var rabbitPoints = 0
        var turtlePoints = 0
        
        for animal in animals {
            switch animal.rawValue {
            case "🐶":
                dogPoints += 1
            case "🐱":
                catPoints += 1
            case "🐰":
                rabbitPoints += 1
            case "🐢":
                turtlePoints += 1
            default:
                break
            }
        }
        
        if dogPoints > catPoints, dogPoints > rabbitPoints, dogPoints > turtlePoints {
            return "🐶"
        } else if catPoints > dogPoints, catPoints > rabbitPoints, catPoints > turtlePoints {
            return "🐱"
        } else if rabbitPoints > dogPoints, rabbitPoints > catPoints, rabbitPoints > turtlePoints {
            return "🐰"
        } else if turtlePoints > dogPoints, turtlePoints > catPoints, turtlePoints > rabbitPoints {
            return "🐢"
        } else {
            return "🐢" }
    }
}

