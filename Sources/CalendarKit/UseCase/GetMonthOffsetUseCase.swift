//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct GetMonthOffsetUseCase {
    
    private let calendar = Calendar.current
    private let currentDate = Date()
    
    public init() { }
    
    public func execute(year: Int, month: Int) -> Int {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1
        
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        
        let yearDifference = (year - currentYear) * 12
        let monthDifference = month - currentMonth
        
        return yearDifference + monthDifference
    }
}

