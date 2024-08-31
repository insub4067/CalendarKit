//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct GetDateComponentListByMonthOffsetUseCase {
    
    private let calendar = Calendar.current
    
    public init() { }
    
    public func exeute(_ offset: Int = 0, includeEmptyDays: Bool = true) -> [DateComponent] {
        
        let currentDate = Date()
        
        guard
            let adjustedDate = calendar.date(
                byAdding: .month,
                value: offset,
                to: currentDate),
            let range = calendar.range(of: .day, in: .month, for: adjustedDate),
            let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: adjustedDate)),
            let firstWeekday = calendar.dateComponents([.weekday], from: firstDayOfMonth).weekday
        else {
            return []
        }
        
        let year = calendar.component(.year, from: adjustedDate)
        let month = calendar.component(.month, from: adjustedDate)
        
        let numberOfEmptyDays = firstWeekday - 1
        var days: [DateComponent] = []
        
        if includeEmptyDays {
            for _ in 0..<numberOfEmptyDays {
                let emptyDate = DateComponent(
                    year: year,
                    month: month,
                    day: -1,
                    isEmptyDay: true)
                days.append(emptyDate)
            }
        }
        
        for day in range {
            let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth)!
            let weekday = calendar.component(.weekday, from: date)
            let new = DateComponent(
                year: year,
                month: month,
                day: day,
                weekday: weekday,
                isEmptyDay: false)
            days.append(new)
        }
        
        return days
    }
}
