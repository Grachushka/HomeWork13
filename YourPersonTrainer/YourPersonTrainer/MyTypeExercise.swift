//
//  MyExercise.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 22/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

class MyTypeExercise {
    
    var dayOfWeek: Week?
    var exerciseType: [ExerciseType]?
    
    init(dayOfWeek: Week, exerciseType: [ExerciseType]) {
        
        self.dayOfWeek = dayOfWeek
        self.exerciseType = exerciseType
    }
    init() {
        
    }
}
