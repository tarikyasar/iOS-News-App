//
//  SourceResponse.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

struct Source: Codable {
    let id: String?
    let name: String
    
    static var sampleSourceData = Source(
        id: "123",
        name: "Source.org"
    )
}
