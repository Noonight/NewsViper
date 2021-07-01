//
//  NewsTableViewCell.swift
//  NewsViper
//
//  Created by Aiur on 02.07.2021.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var uuidLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  var model: News? {
    didSet {
      guard let model = model else { return }
      uuidLabel.text = model.id.uuidString
      titleLabel.text = model.title
      contentLabel.text = model.content
    }
  }
  
}
