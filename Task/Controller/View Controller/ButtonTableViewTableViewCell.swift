//
//  ButtonTableViewTableViewCell.swift
//  Task
//
//  Created by Dominic Lanzillotta on 1/30/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class ButtonTableViewTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Actions
    @IBAction func completeButtonTapped(_ sender: UIButton) {
    }
    
    //MARK: - Private Functions
    func update(withTask task: Task) {
        primaryLabel.text = task.name
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        } else {
            completeButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}
