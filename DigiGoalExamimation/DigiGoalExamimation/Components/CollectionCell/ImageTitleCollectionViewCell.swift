//
//  ImageTitleCollectionViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

class ImageTitleCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ImageTitleCollectionViewCell"
  
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var title: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.masksToBounds = false
    mainView.layer.borderColor = UIColor.primaryRed.cgColor
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    mainView.layer.shadowOpacity = 0
    mainView.layer.shadowOffset = .zero
    mainView.layer.shadowRadius = 0
  }
  
  func configureCell(image: UIImage, imageColor: UIColor, title: String, enableShadow: Bool = false) {
    self.image.image = image
    self.image.tintColor = imageColor
    self.title.text = title
    if enableShadow {
      mainView.layer.shadowOpacity = 0.4
      mainView.layer.shadowOffset = CGSize(width: 1, height: 1)
      mainView.layer.shadowRadius = 3
    }
  }
  
}
