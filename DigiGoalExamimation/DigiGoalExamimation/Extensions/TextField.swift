//
//  TextField.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

extension UITextField {
  
  func setPlaceHolderTextStyle(font: UIFont, color: UIColor) {
    attributedPlaceholder = NSAttributedString(
      string: placeholder != nil ? placeholder! : "",
      attributes:[
        .foregroundColor: color,
          .font: font
      ]
    )
  }
  
  func setIconLeft(_ icon: UIImage, size: CGFloat) {
    let iconView = UIView(frame: CGRect(x: 0, y: 0, width: size , height: size))
    iconView.layer.borderWidth = 1.5
    iconView.layer.borderColor = UIColor.systemGray6.cgColor
    iconView.layer.cornerRadius = AppConstants.eightCornerRadius
    iconView.layer.masksToBounds = true
    let iconImage = UIImageView(image: icon)
    iconImage.contentMode = .scaleAspectFit
    iconImage.frame = CGRect(x: 0, y: 0, width: size, height: size)
    iconView.addSubview(iconImage)
    self.leftView = iconView
    self.leftViewMode = .always
  }
  
}
