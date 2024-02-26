//
//  CreatePageTableViewCell.swift
//  charity360
//
//  Created by user1 on 10/01/24.
//

import UIKit

class CreatePageTableViewCell: UITableViewCell {
    

    @IBOutlet weak var CellName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with deets: details) {
        CellName.text = deets.buttonName
    }

}
