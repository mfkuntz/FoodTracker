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
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        loadSampleMeals()
    }
    
    func loadSampleMeals(){
        let photo1 = UIImage(named: "meal1")!
        let meal1 = Meal(name: "Wrap", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")!
        let meal2 = Meal(name: "Chicken sandwich", photo: photo2, rating: 2)!
        
        let photo3 = UIImage(named: "meal3")!
        let meal3 = Meal(name: "Pizza", photo: photo3, rating: 5)!
        
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
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            mealList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if (editingStyle == .Insert) {
            //
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    
    //MARK: Navigation
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? MealViewController,
            meal = sourceViewController.meal{
                
                //existing row is chosen
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    
                    mealList[selectedIndexPath.row] = meal
                    tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                    
                }else{
                 
                    let newIndexPath = NSIndexPath(forRow: mealList.count, inSection: 0)
                    
                    mealList.append(meal)
                    
                    tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                    
                }
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetail"){
            
            let mealDetail = segue.destinationViewController as! MealViewController
            
            if let selectedMealCell = sender as? MealTableViewCell{
                
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = mealList[indexPath.row]
                
                mealDetail.meal = selectedMeal
                
                
            }
            
            
        }else if (segue.identifier == "AddItem"){
            //handled elsewhere
            print("AddItem")
        }
    }
    

}
