//
//  ButtonTableViewCell.swift
//  TaskiOS22
//
//  Created by Porter Frazier on 10/10/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit



protocol ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    
}

class ButtonTableViewCell: UITableViewCell {

    var delegate: ButtonTableViewCellDelegate?
    
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
    func update(withTask task: Task) {
        
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }

}
