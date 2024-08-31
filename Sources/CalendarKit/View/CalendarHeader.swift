//
//  SwiftUIView.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import SwiftUI

public struct CalendarHeader<Content: View>: View {
    
    let cellBuilder: (WeekDay) -> Content
    
    public init(@ViewBuilder cellBuilder: @escaping (WeekDay) -> Content) {
        self.cellBuilder = cellBuilder
    }
    
    public var body: some View {
        LazyVGrid(columns: .init(repeating: .init(), count: 7), content: {
            ForEach(WeekDay.allCases, id: \.self) { weekday in
                cellBuilder(weekday)
            }
        })
    }
}

#Preview {
    CalendarHeader {
        Text($0.korean)
            .fontWeight(.medium)
    }
}
