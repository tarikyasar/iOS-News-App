//
//  DateUtils.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 13.08.2023.
//

import Foundation

func getCurrentDate(format: String = "yyyy-MM-dd") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: Date().addingTimeInterval((-1)*(24)*(60)*(60)))
}

func getDateFromString(date: String) -> Date? {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    return formatter.date(from: date)
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    
    return dateFormatter.string(from: date)
}
