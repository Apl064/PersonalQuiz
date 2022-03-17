//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Pavel Metelin on 3/15/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var chosenAnimalLabel: UILabel!
    @IBOutlet var chosenAnimalDescLabel: UILabel!
        
    var answersChosen: [Answer]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        chosenAnimalLabel.text = "Вы - \(getChosenAnimal(from: answersChosen).rawValue)!"
        chosenAnimalDescLabel.text = getChosenAnimal(from: answersChosen).definition
    }
    
    private func getChosenAnimal(from answers: [Answer]) -> Animal {
        
        let chosenAnimal = answersChosen.map {$0.animal}
            .reduce(into: [:]) {counts, animal in
                counts[animal, default: 0] += 1
            }
            .filter{$0.value != 1}
        
        return chosenAnimal.first?.key ?? .dog
    }
}
