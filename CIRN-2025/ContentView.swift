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
            ManufacturingCompaniesView(viewModel: ManufacturingViewModel())
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
                    Label("Membership", systemImage: "globe")
                }
		}
    }
}

#Preview {
    ContentView()
}
