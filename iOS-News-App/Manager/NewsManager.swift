//
//  NewsManager.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

class NewsManager {
    
    func getNews(
        fromDate: String,
        searchQuery: String,
        _ completion:@escaping (News?, Error?) -> ()
    ) {
        Bundle.main.fetchData(
            url: "\(API_URL)&from=\(fromDate)&q=\(searchQuery)",
            model: News.self
        ) { data in
            completion(data, nil)
        } failure: { error in
            completion(nil, error)
        }
    }
}
