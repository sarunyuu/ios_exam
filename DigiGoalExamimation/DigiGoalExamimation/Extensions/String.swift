//
//  String.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import Foundation

extension String {
  
  func currencyFormat(decimalNumber: Int) -> String {
    guard let number = Double(self) else { return self }
    let currencyFormat = NumberFormatter()
    currencyFormat.numberStyle = .currency
    currencyFormat.currencySymbol = ""
    currencyFormat.minimumFractionDigits = decimalNumber
    currencyFormat.maximumFractionDigits = decimalNumber
    if let currency = currencyFormat.string(from: number as NSNumber) {
      return currency
    }
    return self
  }
  
}
