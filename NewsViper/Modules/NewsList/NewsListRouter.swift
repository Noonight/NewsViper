//
//  NewsRouter.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import UIKit

final class NewsListRouter: NewsListRouterProtocol {
  
  var view: NewsListViewProtocol?
  
  static func createModule() -> UIViewController {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let identifier = "NewsListViewController"
    let vc = storyboard.instantiateViewController(withIdentifier: identifier)
    guard let view = vc as? NewsListViewController else {
      fatalError("Cannot find viewController with identifier \(identifier)")
    }
    let interactor = NewsListInteractor()
    let router = NewsListRouter()
    let presenter = NewsListPresenter(view: view, interactor: interactor)
    
    view.presenter = presenter
    view.router = router
    interactor.presenter = presenter
    router.view = view
    
    return view
  }
  
  func routeTo(detail model: News) {
    
  }
  
}
