//
//  NewsSpaceApp.swift
//  NewsSpace
//
//  Created by Adrian Bilescu on 06.12.2023.
//

import SwiftUI

@main
struct NewsSpaceApp: App {
    var body: some Scene {
        WindowGroup {
            NewsFeedListView(viewModel: NewsFeedListViewModel(useCase: DemoFetchHeadlinesUseCase()))
        }
    }
}

