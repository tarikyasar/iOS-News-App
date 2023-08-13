//
//  ArticleListViewModel.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    private let newsManager = NewsManager()
    
    @Published var news: News?
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    @Published var searchText: String = "ios"
    
    func getNews(
        fromDate: String,
        searchQuery: String
    ) {
        newsManager.getNews(
            fromDate: fromDate,
            searchQuery: searchQuery,
            { response, error in
                DispatchQueue.main.async {
                    self.isLoading = true
                    
                    self.news = response
                    self.error = error
                    
                    self.isLoading = false
                }
            }
        )
    }
    
    func clearSearchText() {
        self.searchText = ""
    }
}
