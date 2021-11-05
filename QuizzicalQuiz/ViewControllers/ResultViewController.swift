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
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateUI(with: calculateAnimal())
    }
    
}

extension ResultViewController {
    private func calculateAnimal() -> Animal? {
        var frequencyOfAnimals: [Animal : Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return .dog }
        
        return mostFrequencyAnimal
    }
    
    private func updateUI(with animal: Animal?) {
        resultLabel.text = "Вы - \(animal?.rawValue ?? "🐶")"
        resultDescriptionLabel.text = animal?.definition ?? ""
    }
}

