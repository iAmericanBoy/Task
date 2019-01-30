//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Dominic Lanzillotta on 1/30/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    //MARK: - Outlets

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    @IBOutlet var toolBar: UIToolbar!
    
    //MARK: - Properties
    var task: Task?
    var dueDateValue: Date?

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    //MARK: - Actions
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, let notes = notesTextView.text else {return}
        if let task = task {
            //update
            TaskController.shared.update(task: task, name: name, notes: notes, due: dueDateValue)
        } else {
            //new
            TaskController.shared.addTaskWith(name: name, notes: notes, due: dueDateValue)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        dueDateTextField.text = sender.date.stringValue()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dueDateTextField.resignFirstResponder()
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        dueDateTextField.resignFirstResponder()
    }
    
    //MARK: - Private Functions
    func updateViews() {
        dueDateTextField.inputView = dueDatePicker
        dueDateTextField.inputAccessoryView = toolBar
        
        guard let task = task  else {return}
        nameTextField.text = task.name
        dueDateTextField.text = task.due?.stringValue()
        notesTextView.text = task.notes
    }
}
