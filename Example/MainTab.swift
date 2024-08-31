//
//  SwiftUIView.swift
//  
//
//  Created by 김인섭 on 9/1/24.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            CalendarExample()
                .tabItem {
                    Label("Caneldar", systemImage: "calendar")
                }
            WidgetExample()
                .tabItem {
                    Label("Widget", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    MainTab()
}
