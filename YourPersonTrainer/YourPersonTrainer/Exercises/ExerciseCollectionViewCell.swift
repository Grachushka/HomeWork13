//
//  ExerciseCollectionViewCell.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
 
    var exercise: Exercise? {
        didSet {
            nameLabel.text = exercise?.name
            if let imageName = exercise?.picture {
                pictureImage.image = UIImage(named: imageName)
             
            } else {
                pictureImage.image = nil
            }
        }
    }
    
}
