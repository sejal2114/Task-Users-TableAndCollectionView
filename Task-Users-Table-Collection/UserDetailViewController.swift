//
//  UserDetailViewController.swift
//  Task-Users-Table-Collection
//
//  Created by Sejal on 20/02/23.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        nameLabel.text = "\(user.firstName) is  \(user.gender)"
    }
}
