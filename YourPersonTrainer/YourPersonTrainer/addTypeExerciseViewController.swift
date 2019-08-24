//
//  addExerciseViewController.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 21/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class addTypeExerciseViewController: UIViewController {

    @IBOutlet weak var typeExercisePickerView: UIPickerView!
    @IBOutlet weak var nameExerciseTextField: UITextField!
    
    var currentItem: enumExerciseType? = .base
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
    
    
    @IBAction func saveNewExercise(_ sender: UIButton) {
        let exercise = Exercise(name: nameExerciseTextField.text!, picture: "exercise\(Int.random(in: 1..<5))")
        ExerciseDataSource.addExercise(exerciseType: currentItem!, exercise: exercise)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
    
extension addTypeExerciseViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return enumExerciseType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        currentItem = enumExerciseType.allCases[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(enumExerciseType.allCases[row].rawValue)"
    }
    
        
        }

    


