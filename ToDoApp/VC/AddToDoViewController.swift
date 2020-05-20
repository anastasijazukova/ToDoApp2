//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by anastasija.zukova on 20/05/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var textEdit: UITextView!
    @IBOutlet weak var dateEdit: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
    }
    @IBAction func done(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
