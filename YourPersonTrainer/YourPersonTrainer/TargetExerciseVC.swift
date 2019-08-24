//
//  CustomViewController.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 21/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class TargetExerciseVC: UIViewController {
    
    @IBOutlet weak var sectionName: UILabel!
    @IBOutlet weak var descriptionOfExercise: UILabel!
    @IBOutlet weak var exercisePicture: UIImageView!
    @IBOutlet weak var exerciseName: UILabel!
    
    var exercise: Exercise?
    var exerciseType: enumExerciseType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ExerciseDataSource.addExercise(exerciseType: .skretching, exercise: exercise!)
        
        sectionName.text = "\(exerciseType!.rawValue)"
        exerciseName.text = exercise?.name
        if let imageName = exercise?.picture {
            exercisePicture.image = UIImage(named: imageName)
        }
        descriptionOfExercise.text = exercise?.description
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
}
