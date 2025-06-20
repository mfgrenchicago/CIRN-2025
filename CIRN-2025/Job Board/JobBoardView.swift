//
//  JobBoardView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/16/25.
//

import SwiftUI

struct JobBoardView: View {

    @StateObject private var viewModel = JobViewModel()
    
    var body: some View {
        NavigationStack {
            
            List(viewModel.jobs) { job in
                VStack(alignment: .leading, spacing: 4) {
                    Text(job.title)
                        .font(.headline)
                    Text(job.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            
            .navigationTitle("Job Boards")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Share") {
                        // Action here
                        print("Post Job button tapped")
                    }.bold()
                }
            }
        }
    }
}

#Preview {
    JobBoardView()
}

