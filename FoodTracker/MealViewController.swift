//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 9/17/15.
//  Copyright © 2015 Matthew Kuntz. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Props
    @IBOutlet weak var mealNameText: UITextField!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mealNameText.delegate = self
        
        //disable save until a valid name is entered
        checkValidMealName()
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
        checkValidMealName()

        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //disable save button while editing
        saveButton.enabled = false
    }
    
    func checkValidMealName(){
        let text = mealNameText.text ?? ""
        
        saveButton.enabled = !text.isEmpty
    }
    
    //MARK: ImagePickerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (saveButton === sender){
            let name = mealNameText.text ?? ""
            let photo = photoView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
            
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    //MARK: Actions
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        mealNameText.resignFirstResponder()
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)

    }
}

