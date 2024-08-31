//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public enum WeekDay: Int, CaseIterable {
    
    case sun, mon, tues, wed, thurs, fri, sat
    
    public var korean: String {
        switch self {
        case .sun:
            return "일"
        case .mon:
            return "월"
        case .tues:
            return "화"
        case .wed:
            return "수"
        case .thurs:
            return "목"
        case .fri:
            return "금"
        case .sat:
            return "토"
        }
    }
    
    public var english: String {
        switch self {
        case .sun:
            return "Sun"
        case .mon:
            return "Mon"
        case .tues:
            return "Tue"
        case .wed:
            return "Wed"
        case .thurs:
            return "Thu"
        case .fri:
            return "Fri"
        case .sat:
            return "Sat"
        }
    }
}
