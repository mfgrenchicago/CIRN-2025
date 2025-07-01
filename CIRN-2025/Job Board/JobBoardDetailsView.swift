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
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(job.title)
                    .font(.title)
                    .bold()

                Text(job.description)
                    .font(.subheadline)

                Divider()

                Group {
                    Text("📞 Phone: \(job.telephone)")
                    Text("✉️ Email: \(job.email)")
                    Text("🌐 Website: \(job.companyURL)")
                    Text("📍 Location: \(job.location)")
                    Text("💰 Salary: \(job.salary)")
                }
                .font(.body)
                .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Job Details")
    }
}
