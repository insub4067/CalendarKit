//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct GetDateRangeUseCase {
    
    private let calendar = Calendar.current
    
    public init() { }
    
    public func execute(
        _ startDate: DateComponents = DateComponents(year: 2020, month: 1, day: 1),
        endYearOffset: Int = 1
    ) -> ClosedRange<Date> {
        let startDate = calendar.date(from: startDate)!
        
        let endDateComponents = DateComponents(
            year: calendar.component(.year, from: Date()) + endYearOffset,
            month: 12,
            day: 31
        )

        let endDate = calendar.date(from: endDateComponents)!
        
        return startDate...endDate
    }
}
