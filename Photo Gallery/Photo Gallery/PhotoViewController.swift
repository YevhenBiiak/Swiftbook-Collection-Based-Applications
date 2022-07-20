//
//  PhotoViewController.swift
//  Photo Gallery
//
//  Created by Евгений Бияк on 20.07.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageTitle: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = image, let title = imageTitle {
            imageView.image = image
            titleLabel.text = title
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
}
