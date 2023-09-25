//
//  HomeViewController.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - IBOutlet
  @IBOutlet weak var homeTableView: UITableView!
  
  // MARK: - Properties
  let mockHomeViewModel: HomeViewModelDetail =
  HomeViewModelDetail(
    goalList: [
      GoalViewModel(icon: UIImage(resource: .travel),currentAmount: "18000", totlaAmount: "20000", title: "Go to Japan", status: "Good", dayLeft: "45 days left"),
      GoalViewModel(icon: UIImage(resource: .savings),currentAmount: "1000", totlaAmount: "30000", title: "Saving other purpose", status: "Unhappy", dayLeft: "30 days left"),
      GoalViewModel(icon: UIImage(resource: .invest),currentAmount: "20000", totlaAmount: "40000", title: "Buy fund", status: "Unhappy", dayLeft: "3 days left"),
      GoalViewModel(icon: UIImage(resource: .smartphone),currentAmount: "50000", totlaAmount: "50000", title: "Pay myself", status: "Good", dayLeft: "5 days left"),
    ],
    allSavingAmount: "12000000",
    sectionImageList: [
      LinkImageViewModel(title: "Best Offer", imageList: [
        UIImage(resource: .fund),
        UIImage(resource: .fund1),
        UIImage(resource: .planFund)
      ]
                        ),
      LinkImageViewModel(title: "Suggest for you", imageList: [
        UIImage(resource: .promotion),
        UIImage(resource: .suggestFund),
        UIImage(resource: .fund1)
      ]
                        ),
    ]
  )
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  // MARK: - Setup
  private func configureTableView() {
    homeTableView.delegate = self
    homeTableView.dataSource = self
    homeTableView.register(UINib(nibName: GoalTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: GoalTableViewCell.identifier)
    homeTableView.register(UINib(nibName: ImageTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ImageTableViewCell.identifier)
    if #available(iOS 15.0, *) {
      homeTableView.sectionHeaderTopPadding = .zero
    }
    homeTableView.sectionHeaderHeight = .zero
    homeTableView.sectionFooterHeight = .zero
    homeTableView.rowHeight = UITableView.automaticDimension
    homeTableView.estimatedRowHeight = AppConstants.estimateHeight
    homeTableView.contentInset.bottom = 20
  }
  
}
