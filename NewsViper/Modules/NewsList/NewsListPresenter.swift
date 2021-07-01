//
//  NewsPresenter.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import Foundation

final class NewsListPresenter: NewsListPresenterProtocol {
  
  var view: NewsListViewProtocol?
  var interactor: NewsListInputInteractorProtocol?
  
  var dataSource = [News]()
  var _dataSource = [News]()
  
  init(view: NewsListViewProtocol, interactor: NewsListInputInteractorProtocol?) {
    self.view = view
    self.interactor = interactor
  }
  
  func viewDidLoad() {
    interactor?.loadNews()
  }
  
  func filter(with text: String) {
    if text.count == 0 {
      dataSource = _dataSource
      view?.updateView(with: dataSource)
      return
    }
    let searchText = text.lowercased()
    let filtered = _dataSource.filter { (item: News) -> Bool in
      item.title.lowercased().contains(searchText) || item.content.lowercased().contains(searchText)
    }
    dataSource = filtered
    view?.updateView(with: filtered)
  }
  
}

// MARK: Interactor Output
extension NewsListPresenter: NewsListOutputInteractorProtocol {
  
  func didReceiveData(_ news: [News]) {
    _dataSource = news
    dataSource = news
    view?.updateView(with: news)
  }
  
}
