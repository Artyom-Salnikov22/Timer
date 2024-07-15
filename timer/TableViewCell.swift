//
//  TableViewCell.swift
//  timer
//
//  Created by Артём Сальников on 14.07.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var descName: UITextView!
    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
