//
//  CustomInputCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

class CustomInputCell: UITableViewCell {
  
  static let identifier = "CustomInputCell"
  
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var title: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    mainView.layer.borderColor = UIColor.primaryOrange.cgColor
  }
  
  func configureCell(image: UIImage, title: String) {
    self.icon.image = image
    self.title.text = title
  }
  
}
