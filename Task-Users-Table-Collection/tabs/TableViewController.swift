//
//  TableViewController.swift
//  Task-Users-Table-Collection
//
//  Created by Sejal on 19/02/23.
//

import Foundation
import UIKit
import SDWebImage

class TableViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    var users: [User] = []

    override func viewDidLoad() {
        populateStaticData()
      
        title = "Users"
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        usersTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
    }
    
    func populateStaticData(){
        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let user = users[indexPath.row]
        
        cell.labelName.text = "\(user.firstName) \(user.maidenName) \(user.lastName)"
        cell.labelGender.text = user.gender
        let url = URL(string: user.image)

        cell.imageUser.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
        return cell
    }
    
    
}
