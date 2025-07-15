//
//  ContentView.swift
//  CIRN-2025
//
//  Created by Pauline Lake on 6/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
			ManufacturingCompaniesView(viewModel: ManufacturingViewModel(apiService: ManufacturersAPIServiceImpl()))
                .tabItem {
                    Label("Directory", systemImage: "book.fill")
                }
            
            JobBoardView(viewModel: JobBoardViewModel())
                .tabItem {
                    Label("Jobs",
                          systemImage: "briefcase")
                }
            MembershipView(viewModel: MembershipViewModel())
                .tabItem {
                    Label("Membership", systemImage: "person.3")
                }
            AboutUsView()
                .tabItem {
                    Label("About Us", systemImage: "book")
                }
            SupportWebView()
                .tabItem {
                    Label("Support", systemImage: "folder")
                }
        }
    }
}

#Preview {
    ContentView()
}
