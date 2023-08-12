//
//  NewsRepositoryImpl.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

class NewsRepositoryImpl: NewsRepository {
    let api = NewsApi()
    
    func getNews(
        fromDate: String,
        searchQuery: String
    ) -> NewsResponse? {
        return api.getNews(
            fromDate: fromDate,
            searchQuery: searchQuery
        ) { response in
            
            response.self
        }
    }
    
}
