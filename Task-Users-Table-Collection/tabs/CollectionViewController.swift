//
//  CollectionViewController.swift
//  Task-Users-Table-Collection
//
//  Created by Sejal on 19/02/23.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    var users: [User] = []

    override func viewDidLoad() {
//        populateStaticData()
        fetchUsersFromAPI()
        title = "Users"
        let nib = UINib(nibName: "UserCollectionViewCell", bundle: nil)
        usersCollectionView.register(nib, forCellWithReuseIdentifier: "UserCollectionViewCell")
        
        usersCollectionView.delegate = self
        usersCollectionView.dataSource = self
        
    }
    
    func populateStaticData(){
//        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
//        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
//        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
//        users.append(User(firstName: "dfsd", lastName: "bjvbn", maidenName: "ttry", image: "https://robohash.org/facilisdignissimosdolore.png", eyeColor: "dfds", gender: "fdrgdr", hair: Hair(color: "fsdf", type: "fdgfd")))
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        let user = users[indexPath.row]
        
        cell.labelName.text = "\(user.firstName) \(user.lastName)"
        let url = URL(string: user.image)
        cell.userImage.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (collectionView.frame.size.width - 10) / 2, height: (collectionView.frame.size.height - 50) / 4)
    }
    
}

extension CollectionViewController {
    func fetchUsersFromAPI(){
        let url = URL(string: "https://dummyjson.com/users")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            print(String(data: data!, encoding: .utf8) as Any)
                     
            let decoder = JSONDecoder()
            let root: Root = try! decoder.decode(Root.self, from: data!)
            
            self.users = root.users
            
            DispatchQueue.main.async {
                self.usersCollectionView.reloadData()
            }
        }
        
        dataTask.resume()
    }
}
