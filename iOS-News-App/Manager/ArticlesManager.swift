//
//  NewsManager.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

class ArticlesManager {
    
    func getArticles(
        fromDate: String,
        searchQuery: String,
        _ completion:@escaping (ArticlesResponse?, Error?) -> ()
    ) {
        Bundle.main.fetchData(
            url: "\(API_URL)&from=\(fromDate)&q=\(searchQuery)",
            model: ArticlesResponse.self
        ) { data in
            completion(data, nil)
        } failure: { error in
            completion(nil, error)
        }
    }
}
