//
//  FetchHeadlinesUseCase.swift
//  NewsSpace
//
//  Created by Adrian Bilescu on 06.12.2023.
//

import Foundation

protocol FetchHeadlinesUseCase {
    func fetchHeadlines() async throws -> [Headline]
}
