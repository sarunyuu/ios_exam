//
//  InputTableViewCell.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

enum InputCellGoalType {
  case amount, selectDate, selectAccount, perMonth
}

class InputTableViewCell: UITableViewCell {
  
  static let identifier = "InputTableViewCell"
  
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var inputTextField: UITextField!
  @IBOutlet weak var unitText: UILabel!
  @IBOutlet weak var iconArrowDown: UIImageView!
  
  private var accountViewModel: [(UIImage,String)] = []
  private var cellype: InputCellGoalType = .amount
  private let localeTH = Locale(identifier: "th_TH")
  
  private lazy var displayDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = localeTH
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    configureViews()
  }
  
  func configureViews() {
    // Border
    mainView.layer.borderColor = UIColor.primaryRed.cgColor
    // Action
    inputTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    iconArrowDown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showMenu)))
    // Text field
    inputTextField.delegate = self
    inputTextField.setPlaceHolderTextStyle(font: inputTextField.font!, color: .systemGray)
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    let barButtonItem = UIBarButtonItem(title: "Done" , style: .plain, target: self, action: #selector(doneTap))
    barButtonItem.tintColor = UIColor.primaryOrange
    barButtonItem.setTitleTextAttributes([.font : inputTextField.font!], for: .normal)
    let flexibleBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.setItems([flexibleBarButtonItem,barButtonItem], animated: true)
    inputTextField.inputAccessoryView = toolbar
  }
  
  func configureSelectDateTextField() {
    // Input type date
    let datePicker = UIDatePicker()
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.datePickerMode = .date
    datePicker.calendar = Calendar(identifier: .buddhist)
    datePicker.locale = localeTH
    inputTextField.inputView = datePicker
    inputTextField.tintColor = .clear
  }
  
  func configureSelectAccountTextField() {
    let accountInputView = CustomInputView(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
    accountInputView.delegate = self
    accountInputView.dataSource = accountViewModel
    inputTextField.inputView = accountInputView
    inputTextField.tintColor = .clear
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    iconArrowDown.gestureRecognizers?.forEach {
      iconArrowDown.removeGestureRecognizer($0)
    }
    inputTextField.inputView = nil
    inputTextField.tintColor = .primaryOrange
    inputTextField.leftView = nil
    inputTextField.leftViewMode = .never
  }
  
  func configureInputCell(type: InputCellGoalType, accountList: [(icon: UIImage,number: String)]? = nil) {
    cellype = type
    unitText.isHidden = (type == .selectDate || type == .selectAccount) ? true : false
    iconArrowDown.isHidden = (type == .amount || type == .perMonth) ? true : false
    inputTextField.keyboardType = .default
    switch type {
    case .amount:
      inputTextField.placeholder = "Amount"
      inputTextField.keyboardType = .numberPad
      break
    case .selectDate:
      inputTextField.placeholder = "Select Date"
      configureSelectDateTextField()
      break
    case .selectAccount:
      accountViewModel = accountList ?? []
      inputTextField.placeholder = "Select Account"
      configureSelectAccountTextField()
      break
    case .perMonth:
      inputTextField.placeholder = "Amount Per Month"
      inputTextField.keyboardType = .numberPad
      break
    }
  }
  
  @objc func showMenu() {
    inputTextField.becomeFirstResponder()
  }
  
  @objc private func doneTap() {
    if cellype == .selectDate {
      // Get date picker
      let selectDateView = inputTextField.inputView as! UIDatePicker
      // Set text
      let selectStartDateFromPicker = displayDateFormatter.string(from: selectDateView.date)
      guard inputTextField.text != selectStartDateFromPicker else {
        // End editing
        inputTextField.resignFirstResponder()
        return
      }
      inputTextField.text = selectStartDateFromPicker
      // End editing
      inputTextField.resignFirstResponder()
    } else if cellype == .amount || cellype == .perMonth {
      inputTextField.resignFirstResponder()
    } else {
      inputTextField.resignFirstResponder()
    }
  }
  
}

extension InputTableViewCell: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    if cellype == .amount || cellype == .perMonth {
      textField.text = textField.text?.replacingOccurrences(of: ",", with: "").currencyFormat(decimalNumber: 0)
    }
  }
  
}

extension InputTableViewCell: CustomInputViewDelegate {
  func didSelectData(data: (UIImage, String)) {
    inputTextField.resignFirstResponder()
    inputTextField.text = " \(data.1)"
    inputTextField.setIconLeft(data.0, size: 30)
  }
}
