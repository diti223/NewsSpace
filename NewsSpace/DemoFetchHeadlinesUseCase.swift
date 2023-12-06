//
//  DemoFetchHeadlinesUseCase.swift
//  NewsSpace
//
//  Created by Adrian Bilescu on 06.12.2023.
//

import Foundation

struct DemoFetchHeadlinesUseCase: FetchHeadlinesUseCase {
    func fetchHeadlines() async throws -> [Headline] {
        let headlines = [
            Headline(
                content: "£42,000 raised to fund bucket list for gameshow contestant with MND who won just £5 from his appearance.",
                articleURL: URL(string: "https://www.bbc.co.uk/news/articles/c3g202l04lvo")!
            ),
            Headline(
                content: "Stockton teen ensures seniors are staying warm and unforgotten during holiday season",
                articleURL: URL(string: "https://www.cbsnews.com/sacramento/news/stockton-teen-ensures-seniors-are-staying-warm-and-unforgotten-during-holiday-season/")!
            )
        ]
        
        try await Task.sleep(for: .seconds(2))
        
        return headlines
    }
}
