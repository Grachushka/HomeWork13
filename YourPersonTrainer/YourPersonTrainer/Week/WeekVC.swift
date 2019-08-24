//
//  ViewController.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class WeekVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let enumWeekArray = Week.allCases
    let weekArray = Week.allCases.map { $0.rawValue }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var myTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weekArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
        cell.textLabel?.text = weekArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        //let indexPath = tableView.indexPath(for: cell)!
        let indexPath = myTable.indexPath(for: cell)
        let resultDayOfWeek: Week = enumWeekArray[indexPath!.row]
        (segue.destination as! ExerciseCollectionViewController).dayOfWeek = resultDayOfWeek
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    
   
    


}

