//
//  AchievementViewController.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

class AchievementViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  // MARK: - IBOutlet
  @IBOutlet weak var levelText: UILabel!
  @IBOutlet weak var achievementCollectionView: UICollectionView!
  
  // MARK: - Properties
  private let collectionViewInterItemSpace: CGFloat = 10
  private let collectionViewLineSpace: CGFloat = 20
  private let numberOfItemInLine = 3
  private let mockAchievementData: AchievementViewModel = AchievementViewModel(level: "10", achievementList: [
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
    AchievementDetailViewModel(image: UIImage(resource: .medal), title: "Achievement"),
  ])
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    levelText.text = mockAchievementData.level
    configureCollectionView()
  }
  
  // MARK: - Setup
  func configureCollectionView() {
    achievementCollectionView.dataSource = self
    achievementCollectionView.delegate = self
    achievementCollectionView.register(UINib(nibName: ImageTitleCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageTitleCollectionViewCell.identifier)
    achievementCollectionView.contentInset = UIEdgeInsets(top: collectionViewLineSpace, left: collectionViewLineSpace, bottom: collectionViewLineSpace, right: collectionViewLineSpace)
    achievementCollectionView.reloadData()
    achievementCollectionView.collectionViewLayout.invalidateLayout()
  }
  
  // MARK: - Extension
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return mockAchievementData.achievementList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let achievementCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageTitleCollectionViewCell.identifier, for: indexPath) as! ImageTitleCollectionViewCell
    let viewModel = mockAchievementData.achievementList[indexPath.item]
    achievementCell.configureCell(image: viewModel.image, imageColor: .primaryOrange, title: viewModel.title)
    return achievementCell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return collectionViewInterItemSpace
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return collectionViewLineSpace
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = collectionView.getItemSquareItemSize(numberOfItemInLine: numberOfItemInLine, betweenItemSpace: collectionViewInterItemSpace)
    print("itemSize: \(itemSize)")
    return itemSize
  }
  
}
