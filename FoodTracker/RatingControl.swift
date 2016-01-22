//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 1/21/16.
//  Copyright © 2016 Matthew Kuntz. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout() //trigger a ui update after value changes
        }
    }
    var ratingButtons = [UIButton]()
    
    let numStars = 5
    let spacing = 5
    

    // MARK: Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        let filledStar = UIImage(named: "filledStar")
        let emptyStar = UIImage(named: "emptyStar")
        
        for _ in 0..<numStars{
        
            let button = UIButton()
            
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            
            addSubview(button)
            
        }
        
    }
    
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x:0, y:0, width: 44, height: 44)
        
        for (index, button) in ratingButtons.enumerate() {
            
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
            
        }
        
        updateButtonSelectionState()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing)  * numStars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionState()
        
    }
    
    func updateButtonSelectionState(){
        
        for (index, button) in ratingButtons.enumerate(){
            
            //if the button is less than the rating, select it
            button.selected = (index < rating)
            
        }
        
    }

}
