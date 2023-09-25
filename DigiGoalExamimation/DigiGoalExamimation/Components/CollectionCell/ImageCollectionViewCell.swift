//
//  ImageCollectionViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ImageCollectionViewCell"
  
  @IBOutlet weak var mainImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    mainImage.layer.borderColor = UIColor.systemGray6.cgColor
  }

  func configureCell(image: UIImage) {
    mainImage.image = image
  }
  
}
