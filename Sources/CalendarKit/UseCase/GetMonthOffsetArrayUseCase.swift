//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct GetMonthOffsetArrayUseCase {
    
    private let calendar = Calendar.current
    private let currentDate = Date()
    
    public init() { }
    
    public func execute() -> [Int] {
        
        let startDateComponents = DateComponents(year: 2020, month: 1, day: 1)
        guard let startDate = calendar.date(from: startDateComponents) else {
            return []
        }
        
        let currentMonthIndex = calendar.dateComponents([.month], from: startDate, to: currentDate).month ?? 0
        let endDateComponents = DateComponents(
            year: calendar.component(.year, from: currentDate) + 1,
            month: 12,
            day: 1)
        guard let endDate = calendar.date(from: endDateComponents) else {
            return []
        }
        let totalMonths = calendar.dateComponents([.month], from: startDate, to: endDate).month ?? 0

        var monthOffsets: [Int] = []
        for monthIndex in 0...totalMonths {
            monthOffsets.append(monthIndex - currentMonthIndex)
        }
        return monthOffsets
    }
}
