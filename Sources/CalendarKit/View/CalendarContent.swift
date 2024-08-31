//
//  SwiftUIView.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import SwiftUI

public struct CalendarContent<Content: View>: View {
    
    let offset: Int
    let vSpacing: CGFloat
    let cellBuilder: (DateComponent) -> Content
    @State var dates: [DateComponent] = []
    
    private let getDates = GetDateComponentListByMonthOffsetUseCase()
    
    init(
        offset: Int,
        vSpacing: CGFloat = 12,
        @ViewBuilder _ cellBuilder: @escaping (DateComponent) -> Content
    ) {
        self.offset = offset
        self.vSpacing = vSpacing
        self.cellBuilder = cellBuilder
    }
    
    public var body: some View {
        LazyVGrid(columns: .init(repeating: .init(), count: 7), spacing: vSpacing) {
            ForEach(self.dates, id: \.id) { date in
                cellBuilder(date)
            }
        }
        .frame(alignment: .top)
        .onAppear {
            self.dates = self.getDates.exeute(self.offset)
        }
    }
}

#Preview {
    CalendarContent(offset: 0) { date in
        Text(String(date.day))
            .fontWeight(.medium)
            .foregroundStyle(Color.gray)
            .frame(height: 60, alignment: .top)
    }
}
