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
        fetchUsersFromApi()
      
        title = "Users"
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        usersTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
    }
    
    func fetchUsersFromApi(){
        
            let url = URL(string: "https://dummyjson.com/users")!
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let urlSession = URLSession(configuration: .default)
            
            let dataTask = urlSession.dataTask(with: request) { data, response, error in
                print(String(data: data!, encoding: .utf8)!)
                         
                let decoder = JSONDecoder()
                let root: Root = try! decoder.decode(Root.self, from: data!)
                
                self.users = root.users
                
                DispatchQueue.main.async {
                    self.usersTableView.reloadData()
                }
            }
            
            dataTask.resume()
        }
        
    }


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        
        viewController.user = user
        self.navigationController?.pushViewController(viewController, animated: true)
        print("Tapped \(user.firstName)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let user = users[indexPath.row]
        
        cell.labelName.text = "\(user.firstName) \(user.maidenName) \(user.lastName)"
        cell.labelGender.text = user.gender
        let url = URL(string: user.image)

        cell.imageUser.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
        
        cell.imageUser.layer.cornerRadius = CGFloat(5)
        cell.imageUser.layer.masksToBounds = true
        cell.imageUser.clipsToBounds = true
        
        return cell
    }
    
    
}
