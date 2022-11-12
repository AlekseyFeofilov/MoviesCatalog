//
//  FormatDate.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

extension Date {
    func formatDate() -> String? {
        getFormatter().string(from: self)
    }
}

extension String {
    func formatDate() -> Date? {
        getFormatter().date(from: self)
    }
}

extension String {
    func toHumanReadableFormat() -> String?{
        guard let date = self.formatDate() else { return nil }
        return getHumanReadableFormatted().string(from: date) 
    }
}

private func getFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = Formats.systemDateFormat
    return formatter
}

private func getHumanReadableFormatted() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = Formats.russianDateFormat
    return formatter
}
