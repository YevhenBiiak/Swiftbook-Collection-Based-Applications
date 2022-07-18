//
//  EmojiTableViewCell.swift
//  Emoji Reader
//
//  Created by Евгений Бияк on 18.07.2022.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var object: Emoji? {
        didSet {
            emojiLabel.text = object?.emoji
            nameLabel.text = object?.name
            descriptionLabel.text = object?.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
