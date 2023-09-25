//
//  ImageTableViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
  
  static let identifier = "ImageTableViewCell"
  
  @IBOutlet weak var headText: UILabel!
  @IBOutlet weak var imageCollectionView: UICollectionView!
  
  private let collectionViewSpace: CGFloat = 10
  private var imageCollection: [UIImage] = [] {
    didSet {
      imageCollectionView.reloadData()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    configureCollectionView()
  }
  
  func configureCollectionView() {
    // Data source, delegate
    imageCollectionView.dataSource = self
    imageCollectionView.delegate = self
    // Cell
    imageCollectionView.register(UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    // Layout
    imageCollectionView.setupCollectionViewLayout(
      itemSize: CGSize(width: 300, height: 160),
      lineSpace: collectionViewSpace,
      interItemSpace: collectionViewSpace,
      contentInset: UIEdgeInsets(top: 0, left: collectionViewSpace, bottom: collectionViewSpace, right: collectionViewSpace)
    )
  }
  
  func configureImageCell(headerText: String, imageList: [UIImage]) {
    headText.text = headerText
    imageCollection = imageList
  }
  
}

extension ImageTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageCollection.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
    imageCell.configureCell(image: imageCollection[indexPath.item])
    return imageCell
  }
  
}
