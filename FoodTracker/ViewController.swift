//
//  ViewController.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 9/17/15.
//  Copyright © 2015 Matthew Kuntz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Props
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mealNameText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //hide keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    

    //MARK: Actions
    
    @IBAction func setText(sender: UIButton) {
        mealNameLabel.text = "Default Label"
    }
    
}

