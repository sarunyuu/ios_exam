//
//  CustomInputViewController.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 24/9/2566 BE.
//

import UIKit

protocol CustomInputViewDelegate: AnyObject {
  func didSelectData(data: (UIImage,String))
}

class CustomInputView: UIView, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var mainTableView: UITableView!
  
  var dataSource: [(UIImage,String)]?
  weak var delegate: CustomInputViewDelegate?
  
  private let bottomSafeArea = AppDelegate.shared.getSafeAreaInset().bottom
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeSubviews()
  }
  
  func initializeSubviews() {
    let view = Bundle.main.loadNibNamed("CustomInputView", owner: self, options: nil)![0] as! UIView
    self.addSubview(view)
    view.frame = self.bounds
    configureTableView()
  }
  
  func configureTableView() {
    mainTableView.delegate = self
    mainTableView.dataSource = self
    mainTableView.register(UINib(nibName: CustomInputCell.identifier, bundle: nil), forCellReuseIdentifier: CustomInputCell.identifier)
    mainTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: bottomSafeArea, right: 0)
    mainTableView.rowHeight = 80
    mainTableView.sectionHeaderHeight = .zero
    mainTableView.sectionFooterHeight = .zero
    mainTableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CustomInputCell.identifier, for: indexPath) as! CustomInputCell
    if let data = dataSource?[indexPath.row] {
      cell.configureCell(image: data.0, title: data.1)
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let data = dataSource?[indexPath.row] {
      delegate?.didSelectData(data: data)
    }
  }
  
}
