//
//  myProgrammCollectionViewController.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 24/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class myProgrammCollectionViewController: UICollectionViewController {
    
    var arrayMyProgramm = ExerciseDataSource.myProgrammOfExercises

    override func viewDidLoad() {
        super.viewDidLoad()
        print(arrayMyProgramm.count)
    }

  
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayMyProgramm.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
       // dataSource[section].exercise!.count
        return arrayMyProgramm[section].exerciseType!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myExercise", for: indexPath) as! myProgrammCollectionViewCell
    
        print("indexPath.section", indexPath.section, "indexPath.item", indexPath.item, "indexPath.row", indexPath.row)
        cell.exercise = arrayMyProgramm[indexPath.section].exerciseType![indexPath.item].exercise![indexPath.row] 
        
        return cell
    }

   
   

}
