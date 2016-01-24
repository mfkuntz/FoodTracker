//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 1/24/16.
//  Copyright © 2016 Matthew Kuntz. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK: Properties
    

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
}
