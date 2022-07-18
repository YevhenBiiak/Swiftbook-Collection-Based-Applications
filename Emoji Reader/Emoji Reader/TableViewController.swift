//
//  TableViewController.swift
//  Emoji Reader
//
//  Created by Евгений Бияк on 18.07.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    let objects = [
        Emoji(emoji: "🥰", name: "Love", description: "Let's love each other", isFavorite: false),
        Emoji(emoji: "⚽️", name: "Football", description: "Let's play football together", isFavorite: false),
        Emoji(emoji: "🐈", name: "Cat", description: "Cat is the cutest animal", isFavorite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Emoji Reader"
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        cell.object = objects[indexPath.row]
        
        return cell
    }
}



protocol IdentifiableCell {}
extension IdentifiableCell { static var cellIdentifier: String { String(describing: self) }}
extension UITableViewCell: IdentifiableCell {}

