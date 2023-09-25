//
//  UIViewController.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

extension UIViewController {
  
  class func instantiate<T: UIViewController>(appStoryboard: StoryboardName) -> T {
    let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
    let identifier = String(describing: self)
    return storyboard.instantiateViewController(withIdentifier: identifier) as! T
  }
  
  func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
}
