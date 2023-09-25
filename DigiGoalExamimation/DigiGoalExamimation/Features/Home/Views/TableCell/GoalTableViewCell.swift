//
//  GoalTableViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

protocol GoalTableViewCellDelegate: AnyObject {
  func addNewGoal()
}

class GoalTableViewCell: UITableViewCell {
  
  static let identifier = "GoalTableViewCell"
  
  @IBOutlet weak var goalCollectionView: UICollectionView!
  @IBOutlet weak var goalCountText: UILabel!
  @IBOutlet weak var allSavingAmountText: UILabel!
  @IBOutlet weak var newGoalButton: UIButton!
  
  weak var delegate: GoalTableViewCellDelegate?
  private let collectionViewSpace: CGFloat = 10
  private var goalCollection: [GoalViewModel] = [] {
    didSet {
      goalCollectionView.reloadData()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    configureCollectionView()
  }
  
  func configureCollectionView() {
    // Data source, delegate
    goalCollectionView.dataSource = self
    goalCollectionView.delegate = self
    // Cell
    goalCollectionView.register(UINib(nibName: GoalCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GoalCollectionViewCell.identifier)
    // Layout
    goalCollectionView.setupCollectionViewLayout(
      itemSize: CGSize(width: 160, height: 162),
      lineSpace: collectionViewSpace,
      interItemSpace: collectionViewSpace,
      contentInset: UIEdgeInsets(top: 0, left: collectionViewSpace, bottom: 0, right: collectionViewSpace)
    )
  }
  
  func configureGoalCell(viewModel: [GoalViewModel], allSavingAmount: String, delegate: GoalTableViewCellDelegate) {
    self.delegate = delegate
    goalCollection = viewModel
    goalCountText.text = "\(String(viewModel.count)) Goals"
    allSavingAmountText.text = allSavingAmount.currencyFormat(decimalNumber: 0)
    newGoalButton.addTarget(self, action: #selector(newGoalTap), for: .touchUpInside)
  }
  
  @objc func newGoalTap() {
    delegate?.addNewGoal()
  }
  
}

extension GoalTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return goalCollection.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalCollectionViewCell.identifier, for: indexPath) as! GoalCollectionViewCell
    goalCell.configureCell(viewModel: goalCollection[indexPath.item])
    return goalCell
  }
  
}
