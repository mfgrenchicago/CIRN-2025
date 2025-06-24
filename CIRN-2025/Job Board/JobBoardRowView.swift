//
//  JobBoardRowView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/24/25.
//

import SwiftUI

struct JobBoardRowView: View {
    let job: Job
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(job.title)
                .font(.headline)
            Text(job.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}
