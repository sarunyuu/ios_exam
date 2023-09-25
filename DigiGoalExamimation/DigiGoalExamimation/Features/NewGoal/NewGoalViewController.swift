//
//  NewGoalViewController.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

struct NewGoalExampleViewModel {
  let image: UIImage
  let title: String
}

class NewGoalViewController: UIViewController {
  
  // MARK: - IBOutlet
  @IBOutlet weak var goalTitleTextField: UITextField!
  @IBOutlet weak var mainTableView: UITableView!
  
  // MARK: - Properties
  internal let mockGoalExample: [NewGoalExampleViewModel] = [
    NewGoalExampleViewModel(image: UIImage(resource: .travel), title: "Travel"),
    NewGoalExampleViewModel(image: UIImage(resource: .education), title: "Education"),
    NewGoalExampleViewModel(image: UIImage(resource: .invest), title: "Invest"),
    NewGoalExampleViewModel(image: UIImage(resource: .clothing), title: "Clothing"),
    NewGoalExampleViewModel(image: UIImage(resource: .smartphone), title: "Smartphone"),
    NewGoalExampleViewModel(image: UIImage(resource: .savings), title: "Savings"),
    NewGoalExampleViewModel(image: UIImage(resource: .travel), title: "Travel"),
    NewGoalExampleViewModel(image: UIImage(resource: .education), title: "education"),
  ]
  
  internal let mockBackAccount: [(UIImage,String)] = [
    (icon: UIImage(resource: .kasikorn),title: "xxx-x-x4453-x"),
    (icon: UIImage(resource: .krungthai),title: "xxx-x-x1111-x"),
    (icon: UIImage(resource: .makeByKbank),title: "xxx-x-x7867-x"),
    (icon: UIImage(resource: .scb),title: "xxx-x-x9870-x"),
  ]
  
  private let bottomSafeArea = AppDelegate.shared.getSafeAreaInset().bottom
  
  // Convenience init
  convenience init() {
    self.init(nibName: String(describing: NewGoalViewController.self), bundle: nil)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    goalTitleTextField.delegate = self
    configureTableView()
    hideKeyboardWhenTappedAround()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupKeyboardNotification(status: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    setupKeyboardNotification(status: false)
  }
  
  // MARK: - Setup
  private func setupKeyboardNotification(status: Bool) {
    if status {
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    } else {
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
  }
  
  func configureTableView() {
    mainTableView.dataSource = self
    mainTableView.delegate = self
    mainTableView.register(UINib(nibName: InputTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: InputTableViewCell.identifier)
    mainTableView.register(UINib(nibName: CollectionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CollectionTableViewCell.identifier)
    mainTableView.register(UINib(nibName: ButtonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ButtonTableViewCell.identifier)
    if #available(iOS 15.0, *) {
      mainTableView.sectionHeaderTopPadding = .zero
    }
    mainTableView.sectionFooterHeight = 0.1
    mainTableView.tableFooterView = UIView()
    mainTableView.rowHeight = UITableView.automaticDimension
    mainTableView.estimatedRowHeight = AppConstants.estimateHeight
    mainTableView.contentInset = .zero
  }
  
  // MARK: - Actions
  @objc func keyboardWillShow(_ notification: NSNotification) {
    moveContentInsetWithKeyboard(notification: notification, scrollView: mainTableView,  keyboardWillShow: true)
  }
  
  @objc func keyboardWillHide(_ notification: NSNotification) {
    moveContentInsetWithKeyboard(notification: notification, scrollView: mainTableView, keyboardWillShow: false)
  }
  
  // MARK: - Others
  private func moveContentInsetWithKeyboard(notification: NSNotification, scrollView: UIScrollView, keyboardWillShow: Bool) {
    // Keyboard size
    let keyboardSize = Utility.getKeyboardFrame(notification: notification)
    
    // Change bottom inset
    if keyboardWillShow {
      let totalSpace = keyboardSize.height - bottomSafeArea
      scrollView.contentInset.bottom = totalSpace
      scrollView.verticalScrollIndicatorInsets.bottom = totalSpace
    } else {
      scrollView.contentInset.bottom = 0
      scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
  }
  
}
