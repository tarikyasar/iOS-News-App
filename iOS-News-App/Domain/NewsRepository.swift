//
//  NewsRepository.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

protocol NewsRepository {

    func getNews(
        fromDate: String,
        searchQuery: String
    ) -> NewsResponse?
}
