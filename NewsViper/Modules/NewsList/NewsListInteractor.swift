//
//  NewsInteractor.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import Foundation

final class NewsListInteractor: NewsListInputInteractorProtocol {
  
  var presenter: NewsListOutputInteractorProtocol?
  
  func loadNews() {
    let news = ServerNewsClient.shared.fetchNews()
    presenter?.didReceiveData(news)
  }
  
}
