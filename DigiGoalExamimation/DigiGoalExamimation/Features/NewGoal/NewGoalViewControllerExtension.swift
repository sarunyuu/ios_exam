//
//  NewGoalViewControllerExtension.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

extension NewGoalViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

extension NewGoalViewController: ButtonTableViewCellDelegate {
  func didTapSave() {
    self.navigationController?.popViewController(animated: true)
  }
}

extension NewGoalViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 || section == 3 {
      return 1
    } else {
      return 2
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = indexPath.section
    let row = indexPath.row
    if section == 0 {
      // Goal collection
      let collectionCell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
      collectionCell.configureCollectionCell(viewModels: mockGoalExample)
      return collectionCell
    } else if section == 1 {
      let inputTypeCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as! InputTableViewCell
      // Input type amount
      if row == 0 {
        inputTypeCell.configureInputCell(type: .amount)
      // Input type date
      } else {
        inputTypeCell.configureInputCell(type: .selectDate)
      }
      return inputTypeCell
    } else if section == 2 {
      let inputTypeCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as! InputTableViewCell
      // Input type bank account
      if row == 0 {
        inputTypeCell.configureInputCell(type: .selectAccount, accountList: mockBackAccount)
      // Input type per month
      } else {
        inputTypeCell.configureInputCell(type: .perMonth)
      }
      return inputTypeCell
    } else {
      let buttonCell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
      buttonCell.delegate = self
      return buttonCell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 2 {
      return 50
    }
    return 0.1
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 2 {
      let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
      headerView.backgroundColor = .clear
      let headText = UILabel(frame: CGRect(x: 20, y: 20, width: headerView.frame.size.width - 20, height: headerView.frame.size.height - 20))
      headText.text = "Bank Account"
      headText.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      headText.backgroundColor = .clear
      headerView.addSubview(headText)
      return headerView
    }
    return UIView()
  }
  
}
