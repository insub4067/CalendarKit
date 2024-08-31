//
//  SwiftUIView.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import SwiftUI
import CalendarKit

struct WidgetExample: View {
    
    @State var dates: [DateComponent] = []
    private let getDates = GetDateComponentListByMonthOffsetUseCase()
    private let yearMonthString = GetComponentFromOffsetUseCase().execute(0).yearMonthString
    
    var body: some View {
        VStack {
            Text(yearMonthString)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(columns: .init(repeating: .init(), count: 10)) {
                ForEach(dates, id: \.id) { date in
                    Text(String(date.day))
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                        .frame(width: 24, height: 24)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
        .padding()
        .overlay (
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray.opacity(0.3), lineWidth: 1.0)
        )
        .padding()
        .onAppear {
            self.dates = self.getDates.exeute(includeEmptyDays: false)
        }
    }
}

#Preview {
    WidgetExample()
}
