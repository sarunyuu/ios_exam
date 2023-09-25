//
//  Utility.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

class Utility {
  
  class func getKeyboardFrame(notification: NSNotification) -> CGRect {
    guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return .zero }
    return keyboardSize
  }
  
}
