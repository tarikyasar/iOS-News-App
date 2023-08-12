//
//  SourceResponse.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import Foundation

struct SourceResponse: Codable {
    let id: String
    let name: String
    
    static var sampleSourceResponse = SourceResponse(
        id: "123",
        name: "Source.org"
    )
}
