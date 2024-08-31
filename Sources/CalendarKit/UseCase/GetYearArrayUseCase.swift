//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct GetYearArrayUseCase {
    
    private let calendar = Calendar.current
    private let currentDate = Date()
    
    public init() { }
    
    public func execute(startDate: DateComponents = DateComponents(year: 2020, month: 1, day: 1)) -> [Int] {
        guard let startDate = calendar.date(from: startDate) else {
            return []
        }
        
        let startYear = calendar.component(.year, from: startDate)
        let endYear = calendar.component(.year, from: currentDate) + 1
        
        let years = Array(startYear...endYear)
        return years
    }
}
