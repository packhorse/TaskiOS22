//
//  TaskDetailTableViewController.swift
//  TaskiOS22
//
//  Created by Porter Frazier on 10/10/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueLabel.inputView = dueDatePicker
    }
    
    var dueDateValue: Date?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var dueLabel: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    @IBAction func userTappedView(_ sender: Any) {
        self.nameLabel.resignFirstResponder()
        self.dueLabel.resignFirstResponder()
        self.descriptionTextView.resignFirstResponder()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        save()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueLabel.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    func updateViews() {
        guard let task = task, isViewLoaded else { return }
        
        title = task.name
        nameLabel.text = task.name
        dueLabel.text = (task.due as Date?)?.stringValue()
        descriptionTextView.text = task.notes 
    }
    
    
    
    private func save() {
        
        guard let name = nameLabel.text else { return }
        let due = dueDateValue
        let notes = descriptionTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
    }
    
    
}
