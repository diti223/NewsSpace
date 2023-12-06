//
//  NewsFeedListView.swift
//  NewsSpace
//
//  Created by Adrian Bilescu on 06.12.2023.
//

import SwiftUI

struct NewsFeedListView: View {
    @ObservedObject var viewModel: NewsFeedListViewModel
    var body: some View {
        Group {
            if let headlines = viewModel.headlines {
                makeHeadlinesView(headlines)
            } else {
                ContentUnavailableView("No News", systemImage: "newspaper")
            }
        }.onAppear(perform: {
            viewModel.viewDidLoad()
        })
    }
    
    func makeHeadlinesView(_ headlines: [String]) -> some View {
        List(Array(headlines.enumerated()), id: \.offset) { (index, headline) in
            Text(headline)
                .bold()
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.selectHeadline(at: index)
                }
        }
    }
}

#Preview {
    NewsFeedListView(
        viewModel: NewsFeedListViewModel(useCase: PreviewFetchHeadlinesUseCase())
    )
}

struct PreviewFetchHeadlinesUseCase: FetchHeadlinesUseCase {
    func fetchHeadlines() async throws -> [Headline] {
        [
            Headline(content: "Good news!", articleURL: URL(string: "https://apple.com")!),
            Headline(content: "Everyone", articleURL: URL(string: "https://apple.com")!)
        ]
    }
}
