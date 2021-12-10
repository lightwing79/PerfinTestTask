//
//  ContentView.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardTabView()
                .tabItem {
                    VStack {
                        Text("Dashboard")
                    }
            }
            .tag(0)
            
            TransactionsTabView()
                .tabItem {
                    VStack {
                        Text("Transactions")
                        Image(systemName: "tray")
                    }
            }
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
