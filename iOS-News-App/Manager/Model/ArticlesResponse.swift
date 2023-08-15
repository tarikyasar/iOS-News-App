//
//  GetNewsResponse.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation
import SwiftUI

struct ArticlesResponse: Codable {
    let totalResults: Int
    let articles: [Article]
    
    static var sampleArticlesResponseData = ArticlesResponse(
        totalResults: 5,
        articles: [
            Article.sampleArticleData,
            Article.sampleArticleData,
            Article.sampleArticleData,
            Article.sampleArticleData,
            Article.sampleArticleData
        ]
    )
}
