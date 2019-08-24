//
//  DataSource.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import Foundation

class ExerciseDataSource {
    
    static var array = [ExerciseType]()
    static var myProgrammOfExercises = [MyTypeExercise]()
    var myTypeExercise = [MyTypeExercise]()
    
    
    
    
    static func getExercises() -> [ExerciseType] {
        
        if array.isEmpty {
            
            let exercise = Exercise(name: "Выпады с гантелями", picture: "exercise2")
            let exercise2 = Exercise(name: "Приседания со штангой", picture: "exercise5")
            let exerciseType = ExerciseType(exerciseType: .base, exercise: [exercise, exercise2])
            
            let exercise3 = Exercise(name: "Велотренажор", picture: "exercise3")
            let exerciseType2 = ExerciseType(exerciseType: .cardio, exercise: [exercise3])
            
            
            let exercise4 = Exercise(name: "Растягивания с колесом", picture: "exercise4")
            let exerciseType3 = ExerciseType(exerciseType: .skretching, exercise: [exercise4])
            
            
            
            array.append(exerciseType)
            array.append(exerciseType2)
            array.append(exerciseType3)
            
            return array
            
        } else {
            
            return array
        }
        
    }
    
    static func addExercise(exerciseType: enumExerciseType, exercise: Exercise) {
        for item in array {
            print(item.exerciseType!, exerciseType)
            
            if item.exerciseType == exerciseType {
                print(item.exercise!)
                item.exercise?.append(exercise)
            }
        }
        
    }
    
    static func showMyExercises() {
        
        for item in myProgrammOfExercises {
            print(item.dayOfWeek!.rawValue, "день недели")
            for item5 in item.exerciseType! {
                for item6 in item5.exercise! {
                    print(item6.name)
                }
            }
        }
    }
}
