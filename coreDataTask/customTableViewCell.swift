//
//  customTableViewCell.swift
//  coreDataTask
//
//  Created by Byot on 18/01/22.
//

import UIKit

class customTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stdNameLbl: UILabel!
    @IBOutlet weak var stdRollNoLbl: UILabel!
    @IBOutlet weak var stdDepLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
