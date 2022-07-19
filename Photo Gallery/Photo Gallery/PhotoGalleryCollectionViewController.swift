//
//  PhotoGalleryCollectionViewController.swift
//  Photo Gallery
//
//  Created by Евгений Бияк on 19.07.2022.
//

import UIKit

class PhotoGalleryCollectionViewController: UICollectionViewController {
    
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setupLayout()
    }
    
    private func setupLayout() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = sectionInsets
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20

        let paddingWidth: CGFloat = 20 * (itemsPerRow + 1)
        let frameWidth: CGFloat =  collectionView.frame.width
        let cellWidth: CGFloat = (frameWidth - paddingWidth) / itemsPerRow
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        cell.backgroundColor = .systemYellow
        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
}

extension PhotoGalleryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingWidth: CGFloat = sectionInsets.left * (itemsPerRow + 1)
        let frameWidth: CGFloat =  collectionView.frame.width
        let cellWidth: CGFloat = (frameWidth - paddingWidth) / itemsPerRow

        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
