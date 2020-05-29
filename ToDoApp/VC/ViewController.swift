//
//  MainUIViewController.swift
//  ToDoApp
//
//  Created by anastasija.zukova on 20/05/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//
import Foundation
import UIKit
import CoreData


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
      // MARK: - Properties
    
    var resultController: NSFetchedResultsController<ToDo>!
    let coreDataStack = CoreDataStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Request
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "dateDue", ascending: true)
        // Initiealize result controller
        request.sortDescriptors = [sortDescriptors]
        resultController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        // Fetch
        do {
            try resultController.performFetch()
        } catch {
            print("Perform fetch error \(error)")
        }
        /*guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        */
        // OPTIONAL: Registration of the  custom TableView cell
        /*tableView.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoID")*/
        
        
        // Do any additional setup after loading the view.
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as! UIButton?, let vc = segue.destination as? SecondViewController {
           vc.managedContext = coreDataStack.managedContext
       }
       
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    }

  
    
}

// MARK: Table view data source

    extension ViewController: UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return resultController.sections?.count ?? 0
        }
        func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
            
            // Cell configuration
            let todo = resultController.object(at: indexPath)
            cell.textLabel?.text = todo.titleDo
            cell.detailTextLabel?.text = "\(String(describing: todo.dateDue))"
            
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
                // TODO: Mark as done
                completion(true)
            }
            action.backgroundColor = .green
            action.image = UIImage(systemName: "checkmark", withConfiguration: .none)
            return nil
        }
        func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
                // TODO: Delete todo
                completion(true)
            }
            action.backgroundColor = .red
            action.image = UIImage(systemName: "trash", withConfiguration: .none)
            return nil
        }
    }
    
    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
}

 



