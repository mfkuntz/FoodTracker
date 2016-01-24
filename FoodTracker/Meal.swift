//
//  Meal.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 1/22/16.
//  Copyright © 2016 Matthew Kuntz. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    //MARK: Init
    
    init?(name: String, photo:UIImage?, rating:Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if (name.isEmpty || rating < 0){
            return nil
        }
    }
    
    
}
