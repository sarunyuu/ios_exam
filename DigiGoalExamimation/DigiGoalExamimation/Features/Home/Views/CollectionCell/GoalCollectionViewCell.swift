//
//  GoalCollectionViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

class GoalCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "GoalCollectionViewCell"
  
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var currentAmount: UILabel!
  @IBOutlet weak var totalAmount: UILabel!
  @IBOutlet weak var progressBGView: UIView!
  @IBOutlet weak var progressColorViewWidthConstraint: NSLayoutConstraint!
  @IBOutlet weak var progressColorView: UIView!
  @IBOutlet weak var status: UILabel!
  @IBOutlet weak var dayLeft: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.masksToBounds = false
    mainView.layer.shadowOpacity = 0.4
    mainView.layer.shadowOffset = CGSize(width: 1, height: 1)
    mainView.layer.shadowRadius = 3
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    progressColorViewWidthConstraint.constant = 0
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  func configureCell(viewModel: GoalViewModel) {
    mainView.layer.borderColor = viewModel.status.lowercased() == "good" ? UIColor.primaryGreen.cgColor : UIColor.primaryRed.cgColor
    icon.image = viewModel.icon
    title.text = viewModel.title
    currentAmount.text = viewModel.currentAmount.currencyFormat(decimalNumber: 0)
    totalAmount.text = viewModel.totlaAmount.currencyFormat(decimalNumber: 0)
    calculateProgressBar(viewModel: viewModel)
    dayLeft.text = viewModel.dayLeft
    status.text = viewModel.status
    status.textColor = viewModel.status.lowercased() == "good" ? .primaryGreen : .primaryRed
  }
  
  func calculateProgressBar(viewModel: GoalViewModel) {
    let currentAmount = Double(viewModel.currentAmount) ?? 0.0
    let totlaAmount = Double(viewModel.totlaAmount) ?? 0.0
    let percent = CGFloat((currentAmount * 100) / totlaAmount)
    progressBGView.layoutIfNeeded()
    let fullWidth = progressBGView.bounds.width
    var progressWidth = (percent * fullWidth) / 100
    if progressWidth > fullWidth {
      progressWidth = fullWidth
    }
    progressColorViewWidthConstraint.constant = progressWidth
    progressColorView.layoutIfNeeded()
  }
  
}
