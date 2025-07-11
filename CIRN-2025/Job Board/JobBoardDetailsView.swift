//
//  JobBoardDetailsView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/25/25.
//

import SwiftUI

struct JobBoardDetailsView: View {
    var job: Job

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Job Details")){
                    LabeledContent("Title:", value: job.title)
                    
                    LabeledContent("Location:", value: job.location)
                }
                
                Section(header: Text("Salary")){
                    LabeledContent("Salary:", value: job.salary)
                }
                
                Section(header: Text("Description")){
                    TextEditor(text: .constant(job.description))
                        .frame(height: 300)
                }
            }
            .navigationTitle(job.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Action here
                    } label: {
                        Image(systemName: "envelope")
                    }
                }
            }
        }
    }
}
