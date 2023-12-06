//
//  NewsFeedListViewModel.swift
//  NewsSpace
//
//  Created by Adrian Bilescu on 06.12.2023.
//

import Foundation
import Combine

class NewsFeedListViewModel: ObservableObject {
    // represents 2 states:
    // 1. no content
    // 2. the list of items
    
    @Published public private(set) var headlines: [String]?
    @Published public private(set) var isLoadingContent: Bool = false
    private var fetchedHeadlines: [Headline]? {
        didSet {
            self.headlines = fetchedHeadlines?.map(\.content)
        }
    }
    @Published public var selectedArticleURL: URL?
    
    let useCase: FetchHeadlinesUseCase
    
    public init(useCase: FetchHeadlinesUseCase) {
        self.useCase = useCase
    }
    
    public func viewDidLoad() {
        Task { @MainActor in
            self.isLoadingContent = true
            self.fetchedHeadlines = try await useCase.fetchHeadlines()
            self.isLoadingContent = false
        }
    }
    
    public func selectHeadline(at index: Int) {
        self.selectedArticleURL = fetchedHeadlines?[index].articleURL
    }
}
