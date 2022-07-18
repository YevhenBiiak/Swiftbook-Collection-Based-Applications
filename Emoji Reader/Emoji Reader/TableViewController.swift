//
//  TableViewController.swift
//  Emoji Reader
//
//  Created by Евгений Бияк on 18.07.2022.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Emoji Reader"
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        cell.emojiLabel.text = "😃"
        cell.nameLabel.text = "Smile"
        cell.descriptionLabel.text = "Keep smiling everyday"
        return cell
    }
}



protocol IdentifiableCell {}
extension IdentifiableCell { static var cellIdentifier: String { String(describing: self) }}
extension UITableViewCell: IdentifiableCell {}

