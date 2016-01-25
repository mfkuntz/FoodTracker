//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 1/24/16.
//  Copyright © 2016 Matthew Kuntz. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var mealList = [Meal]()
    
    //MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()
    }
    
    func loadSampleMeals(){
        let photo1 = UIImage(named: "meal1")!
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")!
        let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
        
        mealList += [meal1, meal2, meal3]
    }

    
    //MARK: Table View things

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        let meal = mealList[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        

        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? MealViewController,
            meal = sourceViewController.meal{
            
            let newIndexPath = NSIndexPath(forRow: mealList.count, inSection: 0)
            
            mealList.append(meal)
            
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
        
        
    }
    

}
