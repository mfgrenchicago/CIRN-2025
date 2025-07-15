//
//  JobBoardView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/16/25.
//

import SwiftUI
struct JobBoardView: View {
	
	@StateObject var viewModel = JobBoardViewModel()
	
	var body: some View {
		NavigationStack {
            VStack {
                if !viewModel.jobs.isEmpty {
                    List(viewModel.jobs) { job in
                        NavigationLink {
                            JobBoardDetailsView(job: job)
                        } label: {
                            JobBoardRowView(job: job)
                            
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Job Boards")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Share") {
                                // Action here
                                print("Post Job button tapped")
                            }.bold()
                        }
                    }
                } else {
                    ContentUnavailableView(LocalizedStringKey("No jobs"), systemImage: "magnifyingglass", description: Text("There are no jobs available at this time"))
                }
                    
            }
            .onAppear {
                viewModel.fetchJobs()
            }
            .overlay {
                if viewModel.isLoading == true {
                    ProgressView()
                        .controlSize(.extraLarge)
                }
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text("Check back later"))
            }
		}
	}
}

#Preview {
	JobBoardView(viewModel: JobBoardViewModel())
}

