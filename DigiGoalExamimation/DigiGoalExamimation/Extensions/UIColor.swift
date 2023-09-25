//
//  Colors.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 23/9/2566 BE.
//

import UIKit

extension UIColor {
  
  // MARK: - Initialized
  convenience init(hexString: String, alpha: CGFloat = 1.0) {
    var hexValue = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if hexValue.hasPrefix("#") {
      hexValue.remove(at: hexValue.startIndex)
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: hexValue).scanHexInt64(&rgbValue)
    
    let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  // MARK: - Colors properties
  static var primaryRed: UIColor {
    return UIColor(hexString: "#C85D48")
  }
  
  static var primaryGray: UIColor {
    return UIColor(hexString: "#FAF8F9")
  }
  
  static var primaryOrange: UIColor {
    return UIColor(hexString: "#E5A11C")
  }
  
  static var primaryBlack: UIColor {
    return UIColor(hexString: "#323232")
  }
  
  static var primaryGreen: UIColor {
    return UIColor(hexString: "#097600")
  }
  
}
