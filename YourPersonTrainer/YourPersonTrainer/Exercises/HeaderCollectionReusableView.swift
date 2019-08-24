//
//  HeaderCollectionReusableView.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    var header: enumExerciseType!
      
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerLabel.text = "\(header)"
    }
    
}
