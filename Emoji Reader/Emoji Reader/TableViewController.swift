//
//  TableViewController.swift
//  Emoji Reader
//
//  Created by Евгений Бияк on 18.07.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var emojiArray = [
        Emoji(emoji: "🥰", name: "Love", description: "Let's love each other", isFavorite: false),
        Emoji(emoji: "⚽️", name: "Football", description: "Let's play football together", isFavorite: false),
        Emoji(emoji: "🐈", name: "Cat", description: "Cat is the cutest animal", isFavorite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Emoji Reader"
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - TableViewDataSource TableViewDataDelegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojiArray[indexPath.row]
        cell.configure(withEmoji: emoji)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojiArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        emojiArray.insert(emojiArray.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
    }
}



protocol IdentifiableCell {}
extension IdentifiableCell { static var cellIdentifier: String { String(describing: self) }}
extension UITableViewCell: IdentifiableCell {}

