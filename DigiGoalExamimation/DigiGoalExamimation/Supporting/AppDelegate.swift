//
//  AppDelegate.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: - Properties
  var window: UIWindow?
  
  static var shared: AppDelegate {
    UIApplication.shared.delegate as! AppDelegate
  }
  
  // MARK: - Application lifecycle
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = MainTabBarController.instantiate(appStoryboard: .mainScreen)
    window?.makeKeyAndVisible()
    
    // Connect socket
    SocketHandler.shared.establishConnection()
    
    return true
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Close socket
    SocketHandler.shared.closeConnection()
  }
  
  // MARK: - Others
  func getSafeAreaInset() -> (top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
    let window = UIApplication.shared.windows[0]
    var topSafeArea: CGFloat
    var bottomSafeArea: CGFloat
    var leftSafeArea: CGFloat
    var rightSafeArea: CGFloat
    topSafeArea = window.safeAreaInsets.top
    bottomSafeArea = window.safeAreaInsets.bottom
    leftSafeArea = window.safeAreaInsets.left
    rightSafeArea = window.safeAreaInsets.right
    return (topSafeArea, bottomSafeArea, leftSafeArea, rightSafeArea)
    
  }

}

