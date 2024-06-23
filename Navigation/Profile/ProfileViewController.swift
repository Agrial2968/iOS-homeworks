//
//  ProfileViewController.swift
//  Navigation
//
//  Created by user on 18.06.2024.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    let posts: [Post] = [
        Post(author: "Sapkovsky", description: "The best fantasy story about man with white hair. The best fantasy story about man with white hair. The best fantasy story about man with white hair. The best fantasy story about man with white hair. The best fantasy story about man with white hair. The best fantasy story about man with white hair. The best fantasy story about man with white hair.", image: "vedmak", likes: 1000, views: 1002),
        Post(author: "BBC News", description: "Global warm is absolutely dangerous problem nowdays. Global warm is absolutely dangerous problem nowdays, Global warm is absolutely dangerous problem nowdays, Global warm is absolutely dangerous problem nowdays, Global warm is absolutely dangerous problem nowdays,Global warm is absolutely dangerous problem nowdays", image: "bbc", likes: 9, views: 20000),
        Post(author: "No_name", description: "Hello, this is my first post. Like and subscribe< also add me to Friends. <3", image: "noName", likes: 20, views: 50)
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
               
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let cellPost = posts[indexPath.row]
        cell.configure(with: cellPost)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
