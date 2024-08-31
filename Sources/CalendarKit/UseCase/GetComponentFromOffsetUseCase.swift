//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct GetComponentFromOffsetUseCase {
    
    private let calendar = Calendar.current
    private let currentDate = Date()
    
    public init() { }
    
    public func execute(_ offset: Int) -> DateComponent {
        guard
            let adjustedDate = calendar.date(
                byAdding: .month,
                value: offset,
                to: currentDate
            )
        else {
            return .init(from: .now)
        }
        return adjustedDate.mapToComponent
    }
}
