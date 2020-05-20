//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by anastasija.zukova on 20/05/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var textInput: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Add keyboard by using appropriate method instead of this:
        /*NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: .UIKeyboardWillShow, object: nil)
         and this:
         [[NotificationCenter.default] addObserver:self
         selector:@selector(keyboardWillBeHidden:)
         name:UIKeyboardWillHideNotification object:nil];
         */
        
        textInput.becomeFirstResponder()
    }
    @objc func keyboardWillShow(with notification:Notification) {
        guard let keyboardFrame = notification.userInfo?[""] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        bottomConstraint.constant = keyboardHeight
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
        textInput.resignFirstResponder()
    }
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    //
    
    
    // Do any additional setup after loading the view.
}

// MARK: Done button extension (for use with initially hidden "done" button)
/* extension SecondViewController: UITextViewDelegate {
 func textViewDidBeginEditing(_ textView: UITextView) {
 if doneButton.isHidden {
 doneButton.isHidden = false
 }
 }
 }
 */
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

