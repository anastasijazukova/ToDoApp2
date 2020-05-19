//
//  ViewController.swift
//  ToDoApp
//
//  Created by anastasija.zukova on 19/05/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    // MARK: Outlets
    @IBOutlet var text: [UITextView]!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var Confirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Add keyboard view
    }
    
    @IBAction func confirm(_ sender: Any) {
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}







