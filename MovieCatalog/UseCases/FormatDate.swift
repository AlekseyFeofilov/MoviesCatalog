//
//  FormatDate.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

func formatDate(_ date: Date?) -> String?{
    guard let date = date else { return nil }
    return getFormatter().string(from: date)
}

func formatDate(_ date: String?) -> Date?{
    return getFormatter().date(from: date ?? "")
}

private func getFormatter() -> DateFormatter{
    let formatter = DateFormatter()
    formatter.dateFormat = systemDateFormat
    return formatter
}
