//
//  CollectionTableViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
  
  static let identifier = "CollectionTableViewCell"
  
  @IBOutlet weak var mainCollectionView: UICollectionView!
  @IBOutlet weak var mainCollectionViewHeightConstraint: NSLayoutConstraint!
  
  private let collectionViewInterItemSpace: CGFloat = 10
  private let collectionViewLineSpace: CGFloat = 20
  private let numberOfItemInLine = 3
  private let numberOfRow = 2
  private var quickGoalCollection: [NewGoalExampleViewModel] = [] {
    didSet {
      mainCollectionView.reloadData()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    configureCollectionView()
  }
  
  func configureCollectionView() {
    // Data source, delegate
    mainCollectionView.dataSource = self
    mainCollectionView.delegate = self
    // Cell
    mainCollectionView.register(UINib(nibName: ImageTitleCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageTitleCollectionViewCell.identifier)
    mainCollectionView.contentInset = UIEdgeInsets(top: collectionViewLineSpace, left: collectionViewLineSpace, bottom: collectionViewLineSpace, right: collectionViewLineSpace)
  }
  
  func calculateNewHeightConstraint(itemHeight: CGFloat) {
    let contentInset = mainCollectionView.contentInset
    let newCollectionHeight = itemHeight * CGFloat(numberOfRow) + contentInset.top + contentInset.bottom + collectionViewLineSpace
    if mainCollectionViewHeightConstraint.constant != newCollectionHeight {
      mainCollectionViewHeightConstraint.constant = newCollectionHeight
    }
    mainCollectionView.layoutIfNeeded()
  }
  
  func configureCollectionCell(viewModels: [NewGoalExampleViewModel]) {
    quickGoalCollection = viewModels
  }
  
}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return quickGoalCollection.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let quickGoalCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageTitleCollectionViewCell.identifier, for: indexPath) as! ImageTitleCollectionViewCell
    let viewModel = quickGoalCollection[indexPath.item]
    quickGoalCell.configureCell(image: viewModel.image, imageColor: .primaryRed, title: viewModel.title, enableShadow: true)
    return quickGoalCell
  }
  
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return collectionViewInterItemSpace
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return collectionViewLineSpace
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = collectionView.getItemSquareItemSize(numberOfItemInLine: numberOfItemInLine, betweenItemSpace: collectionViewInterItemSpace)
    calculateNewHeightConstraint(itemHeight: itemSize.height)
    return itemSize
  }
}
