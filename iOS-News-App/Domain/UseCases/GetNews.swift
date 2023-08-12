//
//  GetNews.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

class GetNews {
    let repository = NewsRepositoryImpl()
    
    func invoke(
        fromDate: String,
        searchQuery: String
    )-> NewsResponse? {
        return repository.getNews(
            fromDate: fromDate,
            searchQuery: searchQuery
        )
    }
}
