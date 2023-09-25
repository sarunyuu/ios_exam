//
//  UICollectionView.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

extension UICollectionView {
  
  func setupCollectionViewLayout(itemSize: CGSize,
                                 lineSpace: CGFloat,
                                 interItemSpace: CGFloat,
                                 scrollDirection: UICollectionView.ScrollDirection = .horizontal,
                                 contentInset: UIEdgeInsets = .zero) {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = itemSize
    flowLayout.minimumLineSpacing = lineSpace
    flowLayout.minimumInteritemSpacing = interItemSpace
    flowLayout.scrollDirection = scrollDirection
    flowLayout.headerReferenceSize = .zero
    flowLayout.footerReferenceSize = .zero
    flowLayout.sectionInset = .zero
    self.contentInset = contentInset
    self.collectionViewLayout = flowLayout
  }
  
  func getItemSquareItemSize(numberOfItemInLine: Int, betweenItemSpace: CGFloat) -> CGSize {
    let collectionWidthNoInset = self.bounds.width - (self.contentInset.left * 2)
    let totalBetweenSpace = CGFloat(numberOfItemInLine - 1) * betweenItemSpace
    let itemSize = (collectionWidthNoInset - totalBetweenSpace) / CGFloat(numberOfItemInLine)
    return CGSize(width: Int(itemSize), height: Int(itemSize))
  }
  
}
