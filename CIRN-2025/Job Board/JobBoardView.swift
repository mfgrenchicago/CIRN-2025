//
//  JobBoardView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/16/25.
//

import SwiftUI

struct JobBoardView: View {
	
	var viewModel: JobBoardViewModel
    
    var body: some View {
        NavigationStack {
            List {
				ForEach(viewModel.jobs, id: \.self) { job in
                    Text(job)
                }
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
	JobBoardView(viewModel: JobBoardViewModel())
}

