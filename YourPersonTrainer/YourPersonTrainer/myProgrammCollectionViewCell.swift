//
//  myProgrammCollectionViewCell.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 24/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class myProgrammCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var picutreOfExercise: UIImageView!
    
    @IBOutlet weak var descriptionOfExercise: UILabel!
    @IBOutlet weak var nameOfExercise: UILabel!
    
    
    
    var exercise: Exercise? {
        didSet {
            nameOfExercise.text = exercise?.name
            if let imageName = exercise?.picture {
                picutreOfExercise.image = UIImage(named: imageName)
                
            } else {
                picutreOfExercise.image = nil
            }
         
        }
    }
}
