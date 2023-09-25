//
//  MainTabBarController.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

class MainTabBarController: UITabBarController {
  // MARK: - Properties
  static let identifier = "MainTabBarController"
  private let tabBarHeight: CGFloat = 80
  private let bottomSafeArea = AppDelegate.shared.getSafeAreaInset().bottom
  let socketClient = SocketHandler.shared.getSocket()
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureItemsColor()
    configureBadgeOfTabBarItem()
    listeningSocket()
    print("tabBar.frame.height : \(tabBar.frame.height)")
    print("bottomSafeArea: \(bottomSafeArea)")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    changeTabBarHeight()
  }
  
  // MARK: - Setup
  private func configureItemsColor(){
    tabBar.unselectedItemTintColor = .systemGray
    tabBar.tintColor = .primaryRed
  }
  
  private func listeningSocket() {
    socketClient.on("new-notification") { dataArray, ack in
      if let badgeCount = dataArray[0] as? String {
        self.tabBar.items![3].badgeValue = badgeCount
      }
    }
  }
  
  private func changeTabBarHeight(){
    var tabBarFrame = tabBar.frame
    tabBarFrame.size.height = tabBarHeight + bottomSafeArea
    tabBarFrame.origin.y = view.frame.size.height - tabBarHeight - bottomSafeArea
    tabBar.frame = tabBarFrame
  }
  
  private func configureBadgeOfTabBarItem() {
    let tabBarItemAppearance = UITabBarItemAppearance()
    tabBarItemAppearance.normal.badgeBackgroundColor = .systemRed
    tabBarItemAppearance.normal.badgeTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    tabBarItemAppearance.normal.badgePositionAdjustment = UIOffset(horizontal: 5, vertical: 10)
    let tabBarAppearance = UITabBarAppearance()
    tabBarAppearance.inlineLayoutAppearance = tabBarItemAppearance
    tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
    tabBarAppearance.compactInlineLayoutAppearance = tabBarItemAppearance
    tabBar.standardAppearance = tabBarAppearance
  }
  
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    item.badgeValue = nil
  }
}
