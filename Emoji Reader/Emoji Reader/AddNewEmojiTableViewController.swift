//
//  AddNewEmojiTableViewController.swift
//  Emoji Reader
//
//  Created by Евгений Бияк on 19.07.2022.
//

import UIKit

class AddNewEmojiTableViewController: UITableViewController {

    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var emojiModel: Emoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emojiModel = emojiModel {
            emojiTextField.text = emojiModel.emoji
            nameTextField.text = emojiModel.name
            descriptionTextField.text = emojiModel.description
        }
        updateSaveButtonState()
    }
    
    private func updateSaveButtonState() {
        let isEmpty = [emojiTextField, nameTextField, descriptionTextField].allSatisfy { $0?.text?.isEmpty == true }
        navigationItem.rightBarButtonItem?.isEnabled = !isEmpty
    }
    
    @IBAction func textFieldEditingChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        // pop to TableViewController
        navigationController?.popViewController(animated: true)
        // dissmis self navigation controller
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let emoji = emojiTextField.text!
        let name = nameTextField.text!
        let description = descriptionTextField.text!
        
        emojiModel = Emoji(emoji: emoji, name: name, description: description, isFavorite: false)
    }
}
