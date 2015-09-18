//
//  ViewController.swift
//  FoodTracker
//
//  Created by Matthew Kuntz on 9/17/15.
//  Copyright © 2015 Matthew Kuntz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Props
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameText: UITextField!
    @IBOutlet weak var photoView: UIImageView!
    
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
    
    //MARK: ImagePickerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    //MARK: Actions
    
    @IBAction func setText(sender: UIButton) {
        mealNameLabel.text = "Default Label"
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        mealNameText.resignFirstResponder()
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)

    }
}

