//
//  File.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import Foundation

public struct HourComponent {
    
    public let hour: Int
    public let minute: Int
    
    // "14:30"
    public var hourString: String { "\(hour.twoDigit):\(minute.twoDigit)" }
    
    public init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    public init(hourString: String) {
        let components = hourString
            .split(separator: ":")
            .compactMap { Int($0) }
        guard components.count >= 2 else {
            self = .init(hour: 0, minute: 0)
            return
        }
        self.hour = components[0]
        self.minute = components[1]
    }
    
    public static let `default` = Self(hour: 0, minute: 0)
}
