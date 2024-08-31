//
//  SwiftUIView.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import SwiftUI

struct CalendarExample: View {
    
    @State var offsets: [Int] = []
    @State var current = 0
    @State var yearMonthString = ""
    
    private let getMonthString = GetComponentFromOffsetUseCase()
    private let getMonths = GetMonthOffsetArrayUseCase()
    
    var body: some View {
        VStack(spacing: 16) {
            Text(yearMonthString)
                .bold()
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .monospacedDigit()
            CalendarHeader { weekday in
                Text(weekday.english)
                    .fontWeight(.medium)
            }
            TabView(selection: $current) {
                ForEach(self.offsets, id: \.self) { offset in
                    CalendarContent(offset: offset) { date in
                        Text(String(date.day))
                            .fontWeight(.medium)
                            .foregroundStyle(Color.gray)
                            .frame(height: 60, alignment: .top)
                            .opacity(date.isEmptyDay ? 0 : 1)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .tag(offset)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 436)
        }
        .padding()
        .onAppear {
            self.offsets = self.getMonths.execute()
            self.updateYearMonthString()
        }
        .onChange(of: self.current) { _ in
            self.updateYearMonthString()
        }
    }
    
    func updateYearMonthString() {
        self.yearMonthString = self.getMonthString.execute(self.current).yearMonthString
    }
}

#Preview {
    CalendarExample()
}
