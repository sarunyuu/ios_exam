//
//  HomeViewModel.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

struct GoalViewModel {
  let icon: UIImage
  let currentAmount: String
  let totlaAmount: String
  let title: String
  let status: String
  let dayLeft: String
}

struct LinkImageViewModel {
  let title: String
  let imageList: [UIImage]
}

struct HomeViewModelDetail {
  let goalList: [GoalViewModel]
  let allSavingAmount: String
  let sectionImageList: [LinkImageViewModel]
}

