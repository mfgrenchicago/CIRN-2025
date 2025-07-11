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
                    HStack{
                        Text("Title:")
                        Spacer()
                        Text(job.title)
                            .foregroundColor(.gray)
                    }
                    
                    HStack{
                        Text("Location:")
                        Spacer()
                        Text(job.location)
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("Salary")){
                    HStack{
                        Text("Salary:")
                        Spacer()
                        Text(job.salary)
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("Description")){
                    VStack{
                        Spacer()
                        Text(job.description)
                            .padding(.bottom, 250)
                    }
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
