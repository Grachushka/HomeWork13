//
//  ExerciseType.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

class ExerciseType {
    
    var exerciseType: enumExerciseType?
    var exercise: [Exercise]?
    
    init(exerciseType: enumExerciseType, exercise: [Exercise]) {
    
        self.exercise = exercise
        self.exerciseType = exerciseType
    }
    init() {}
   
}
