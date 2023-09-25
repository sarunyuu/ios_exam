//
//  ButtonTableViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

protocol ButtonTableViewCellDelegate: AnyObject {
  func didTapSave()
}

class ButtonTableViewCell: UITableViewCell {
  
  static let identifier = "ButtonTableViewCell"
  
  @IBOutlet weak var saveButton: UIButton!
  
  weak var delegate: ButtonTableViewCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    saveButton.addTarget(self, action: #selector(tapSave), for: .touchUpInside)
  }
  
  @objc private func tapSave() {
    delegate?.didTapSave()
  }
  
}
