//
//  AchievementViewModel.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 25/9/2566 BE.
//

import UIKit

struct AchievementDetailViewModel {
  let image: UIImage
  let title: String
}

struct AchievementViewModel {
  let level: String
  let achievementList: [AchievementDetailViewModel]
}
