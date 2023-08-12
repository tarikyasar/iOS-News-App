//
//  GetNewsResponse.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation
import SwiftUI

struct NewsResponse: Codable {
    let totalResults: Int
    let articles: [ArticleResponse]
    
    static var sampleNewsResponse = NewsResponse(
        totalResults: 5,
        articles: [
            ArticleResponse.sampleArticleResponse,
            ArticleResponse.sampleArticleResponse,
            ArticleResponse.sampleArticleResponse,
            ArticleResponse.sampleArticleResponse,
            ArticleResponse.sampleArticleResponse
        ]
    )
}
