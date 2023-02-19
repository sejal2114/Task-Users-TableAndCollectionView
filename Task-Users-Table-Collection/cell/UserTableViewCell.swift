//
//  UserTableViewCell.swift
//  Task-Users-Table-Collection
//
//  Created by Sejal on 19/02/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelName: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
