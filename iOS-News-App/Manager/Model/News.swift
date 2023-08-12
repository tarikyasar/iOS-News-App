//
//  GetNewsResponse.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation
import SwiftUI

struct News: Codable {
    let totalResults: Int
    let articles: [Article]
    
    static var sampleNewsResponse = News(
        totalResults: 5,
        articles: [
            Article.sampleArticleResponse,
            Article.sampleArticleResponse,
            Article.sampleArticleResponse,
            Article.sampleArticleResponse,
            Article.sampleArticleResponse
        ]
    )
}
