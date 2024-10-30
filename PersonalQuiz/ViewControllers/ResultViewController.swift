//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func printResult(animal: Animal) {
        resultAnimalLabel.text = "Вы - \(animal.rawValue)!"
        resultDefinitionLabel.text = animal.definition
    }
    
    private func getResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let finalAnimal = frequencyOfAnimals.max { a, b in a.value < b.value }
        
        switch finalAnimal?.key {
        case .cat: printResult(animal: .cat)
        case .dog: printResult(animal: .dog)
        case .rabbit: printResult(animal: .rabbit)
        default: printResult(animal: .turtle)
        }
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
