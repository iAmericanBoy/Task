//
//  ButtonTableViewTableViewCell.swift
//  Task
//
//  Created by Dominic Lanzillotta on 1/30/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit
protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: ButtonTableViewCellDelegate?
    
    //MARK: - Actions
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    //MARK: - Private Functions
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        } else {
            completeButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}
