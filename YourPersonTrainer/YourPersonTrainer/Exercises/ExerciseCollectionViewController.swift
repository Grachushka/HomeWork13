//
//  ExerciseCollectionViewController.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ExerciseCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Упражнения"
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshCollection), for: .valueChanged)
        collectionView.refreshControl = refresh
    }
    
    @IBOutlet weak var myNavigationItem: UINavigationItem!
    
    private let dataSource = ExerciseDataSource.getExercises()
    
    var dayOfWeek: Week?
    var stateButton: Bool = false
    var exerciseType: enumExerciseType?
    var exercise: Exercise?
    var exerciseDataSource = ExerciseDataSource()
    
    var resultPath: [IndexPath] = []{
        
        didSet{
            collectionView.reloadData()
        }
    }
    
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
    @objc private func refreshCollection() {
        collectionView.reloadData()
        collectionView.refreshControl?.endRefreshing()
    }
    
    @IBAction func addExercisesButton(_ sender: UIBarButtonItem) {
        
        if stateButton {
            
            stateButton = false
            sender.title = "Select"
            print("Сработало!")
            
          
    
            var arrayOfMyTypeExercise = [ExerciseType]()
            var arrayOfExercises = [Exercise]()
            var exerciseType = ExerciseType()
            for item in resultPath {
               
                
                let numExerciseType = dataSource[item.first!].exerciseType!
                arrayOfExercises.append(dataSource[item.first!].exercise![item.last!])
                 exerciseType = ExerciseType(exerciseType: numExerciseType, exercise: arrayOfExercises)
                
                
            }
            arrayOfMyTypeExercise.append(exerciseType)
            let exercisegType = MyTypeExercise(dayOfWeek: dayOfWeek!, exerciseType: arrayOfMyTypeExercise)
            
            
            
            exerciseDataSource.myTypeExercise.append(exercisegType)
            
            ExerciseDataSource.myProgrammOfExercises.append(exercisegType)
            ExerciseDataSource.showMyExercises()
            resultPath = []
            navigationItem.title = "Упражнения"
            

            
        } else if !stateButton {

            sender.title = "Save"
            stateButton = true
            
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        
        if originalIndexPath.section != proposedIndexPath.section {
            return originalIndexPath
        }
        return proposedIndexPath
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let exercise = dataSource[sourceIndexPath.section]
        exercise.exercise!.swapAt(sourceIndexPath.item, destinationIndexPath.item)

        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if stateButton {
        for (index, path) in resultPath.enumerated(){
            if path == indexPath{
                resultPath.remove(at: index)
                return
            }
        }
        
        resultPath.append(indexPath)
        navigationItem.title = "\(resultPath.count)"
           

        } else {
            
            exercise = dataSource[indexPath.section].exercise![indexPath.item]
            exerciseType = dataSource[indexPath.section].exerciseType!
            
            let next: TargetExerciseVC = self.storyboard?.instantiateViewController(withIdentifier: "TargetExerciseVC") as! TargetExerciseVC
            next.exercise = exercise
            next.exerciseType = exerciseType
            self.navigationController?.pushViewController(next, animated: true)
            
            
        }
    }
    
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return dataSource.count
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource[section].exercise!.count
        
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(indexPath.section, indexPath.item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exercise", for: indexPath) as! ExerciseCollectionViewCell
        
        cell.exercise = dataSource[indexPath.section].exercise![indexPath.item]
        
        for path in resultPath {
            if path == indexPath {
                cell.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                return cell
            }
        }
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderCollectionReusableView {
            
            view.headerLabel.text = "\(dataSource[indexPath.section].exerciseType!.rawValue)"
            return view
            
        }
        return UICollectionReusableView()
    }
}
