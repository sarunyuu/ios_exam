//
//  HomeViewControllerExtension.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    }
    return mockHomeViewModel.sectionImageList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = indexPath.section
    let row = indexPath.row
    if section == 0 {
      let goalCell = tableView.dequeueReusableCell(withIdentifier: GoalTableViewCell.identifier, for: indexPath) as! GoalTableViewCell
      goalCell.configureGoalCell(viewModel: mockHomeViewModel.goalList, allSavingAmount: mockHomeViewModel.allSavingAmount, delegate: self)
      return goalCell
    } else {
      let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
      let viewModel = mockHomeViewModel.sectionImageList[row]
      imageCell.configureImageCell(headerText: viewModel.title, imageList: viewModel.imageList)
      return imageCell
    }
  }
  
}

extension HomeViewController: GoalTableViewCellDelegate {
  func addNewGoal() {
    // Open new goal
    let newGoalVC = NewGoalViewController()
    newGoalVC.hidesBottomBarWhenPushed = true
    navigationController?.pushViewController(newGoalVC, animated: true)
  }
}
