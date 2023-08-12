//
//  ArticleResponse.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

struct ArticleResponse: Codable {
    let source: SourceResponse
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
    
    static var sampleArticleResponse = ArticleResponse(
        source: SourceResponse.sampleSourceResponse,
        author: "News Writer",
        title: "Breaking News",
        description: "Breaking news breaking news breaking news breaking new",
        url: "www.google.com.tr",
        urlToImage: nil,
        publishedAt: "10-10-2023",
        content: "No content"
    )
}
