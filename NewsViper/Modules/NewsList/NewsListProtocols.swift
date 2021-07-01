//
//  NewsProtocol.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import Foundation

// MARK: - View
protocol NewsListViewProtocol {
  
  var presenter: NewsListPresenterProtocol! { get set }
  var router: NewsListRouterProtocol? { get set }
  
  /* Presenter -> ViewController */
  func updateView(with news: [News])
  
}

// MARK: - Interactor Input
protocol NewsListInputInteractorProtocol {
  
  var presenter: NewsListOutputInteractorProtocol? { get set }
  
  /* Presenter -> Intercator{Input} */
  func loadNews()
  
}

// MARK: - Interactor Output
protocol NewsListOutputInteractorProtocol { // implement in presenter
  
  /* Interactor{Input} -> Interactor{Output} || Presenter */
  func didReceiveData(_ news: [News])
  
}

// MARK: - Presenter
protocol NewsListPresenterProtocol {
  
  var view: NewsListViewProtocol? { get set }
  var interactor: NewsListInputInteractorProtocol? { get set }
  
  var dataSource: [News] { get set }
  
  init(view: NewsListViewProtocol, interactor: NewsListInputInteractorProtocol?)
  
  /* ViewController -> Presenter */
  func viewDidLoad()
  func filter(with text: String)
  
}

// MARK: - Router
protocol NewsListRouterProtocol {
  
  var view: NewsListViewProtocol? { get set }
  
  /* */
  func routeTo(detail model: News)
  
}
