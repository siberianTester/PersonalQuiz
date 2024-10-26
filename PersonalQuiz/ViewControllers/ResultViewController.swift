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
        navigationItem.setHidesBackButton(true, animated: false)
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
        var animals: [String: Int] = ["cat": 0, "dog": 0, "rabbit": 0, "turtle": 0]
        
        for answer in answers {
            switch answer.animal {
            case .cat: animals["cat"]! += 1
            case .dog: animals["dog"]! += 1
            case .rabbit: animals["rabbit"]! += 1
            default: animals["turtle"]! += 1
            }
        }
        
        let finalAnimal = animals.max { a, b in a.value < b.value }
        
        switch finalAnimal?.key {
        case "cat": printResult(animal: .cat)
        case "dog": printResult(animal: .dog)
        case "rabbit": printResult(animal: .rabbit)
        default: printResult(animal: .turtle)
        }
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
