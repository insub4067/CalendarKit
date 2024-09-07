//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct DateComponent: Identifiable {
    
    public let id: String = UUID().uuidString
    
    public let year: Int
    public let month: Int
    public let day: Int
    
    public let weekday: WeekDay
    public let isEmptyDay: Bool
    
    public init(
        year: Int,
        month: Int,
        day: Int,
        weekday: Int = 0,
        isEmptyDay: Bool = false
    ) {
        self.year = year
        self.month = month
        self.day = day
        self.weekday = .init(rawValue: weekday) ?? .sun
        self.isEmptyDay = isEmptyDay
    }
    
    public init(from date: Date) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .weekday], from: date)
        
        self.year = components.year ?? 0
        self.month = components.month ?? 0
        self.day = components.day ?? 0
        self.weekday = WeekDay(rawValue: (components.weekday ?? 1) - 1) ?? .sun
        self.isEmptyDay = false
    }
    
    // 2023.01.01
    public init(dateString: String, separator: String = ".") {
        
        var components = dateString
            .components(separatedBy: separator)
//            .split(separator: separator)
            .compactMap { Int($0) }
        
        guard components.count == 3 else {
            self.init(from: .now)
            return
        }
        
        guard
            components.count == 3,
            let day = components.popLast(),
            let month = components.popLast(),
            let year = components.popLast()
        else {
            self.init(from: .now)
            return
        }
            
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar.current
        guard let date = calendar.date(from: dateComponents) else {
            self.init(from: .now)
            return
        }
        
        let weekday = calendar.component(.weekday, from: date) - 1
        
        self.init(
            year: year,
            month: month,
            day: day,
            weekday: weekday)
    }
}

extension DateComponent: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.year == rhs.year &&
        lhs.month == rhs.month &&
        lhs.day == rhs.day
    }
    
    public static let now = Date.now.mapToComponent
}


extension DateComponent {
    
    // 1 -> "01"
    public var monthString: String { String(format: "%02d", month) }
    // 1 -> "01"
    public var dayString: String { String(format: "%02d", day) }
    
    // "2024.01"
    public var yearMonthString: String { "\(year).\(monthString)" }
    // "2024.01.01"
    public var yearMonthDayString: String { "\(year).\(monthString).\(dayString)" }
    // "2024.01.01 (월)"
    public var fullDateString: String { "\(yearMonthDayString) (\(weekday.korean))" }
    
    public var mapToDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar.current
        return calendar.date(from: dateComponents) ?? .now
    }
}

extension Date {
    
    public var mapToComponent: DateComponent {
        .init(from: self)
    }
}
