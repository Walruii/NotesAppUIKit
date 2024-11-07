//
//  NoteCellController.swift
//  NotesApp
//
//  Created by Inderpreet Bhatti on 07/11/24.
//

import UIKit

class NoteCellController: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
