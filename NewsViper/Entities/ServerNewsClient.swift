//
//  ServerNewsClient.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import Foundation

class ServerNewsClient {
  
  public static let shared = ServerNewsClient()
  
  private let news: [News] = [
    News(id: UUID(),
         title: "Michael Burry says the market is on the brink of collapse. A WallStreetBets user argues the famed investor's predictions have been mostly wrong for the last 15 years.",
         content: "A post that analyzes how often Michael Burry's bearish forecasts come true is trending on Reddit's WallStreetBets."),
    News(id: UUID(),
         title: "Dow Jones Today Firms Up As Nasdaq Struggles; Oil Stocks Rally Ahead Of OPEC, These 2 China IPOs Spike - Investor's Business Daily",
         content: "Dow Jones Today Firms Up As Nasdaq Struggles; Oil Stocks Rally Ahead Of OPEC, These 2 China IPOs SpikeInvestor's Business Daily Wall Street registers fifth straight quarterly gainAl Jazeera English S&P rallies to record as first half winds downFox Business Do…"),
    News(id: UUID(),
         title: "The Complete Guide To Dyson Products",
         content: "If you take a bird’s eye view of certain industries, you might find that there is a brand that stands apart from the rest of its competition — usually for a multitude of reasons that includes styling…")
  ]
  
  public func fetchNews() -> [News] {
    return news
  }
  
}
