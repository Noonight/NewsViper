//
//  ViewController.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import UIKit

class NewsListViewController: UIViewController, NewsListViewProtocol {
  
  @IBOutlet weak var searchField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  var presenter: NewsListPresenterProtocol!
  var router: NewsListRouterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    presenter.viewDidLoad()
  }
  
}

// MARK: - Setup
extension NewsListViewController {
  
  private func setupUI() {
    navigationController?.navigationBar.prefersLargeTitles = true
    
    searchField.delegate = self
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
}

// MARK: - Presenter
extension NewsListViewController {
  
  func updateView(with news: [News]) {
    tableView.reloadData()
  }
  
}

// MARK: - TextFieldDelegate
extension NewsListViewController: UITextFieldDelegate {
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    presenter.filter(with: "")
    
    textField.endEditing(false)
    
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.endEditing(false)
    guard let text = textField.text else { return true }
    
    presenter.filter(with: text)
    
    return true
  }
  
}

// MARK: - TableViewDelegate
extension NewsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    // router things
  }
  
}

// MARK: - TableViewDataSource
extension NewsListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
  
    cell.model = presenter.dataSource[indexPath.row]
    
    return cell
  }
  
}
