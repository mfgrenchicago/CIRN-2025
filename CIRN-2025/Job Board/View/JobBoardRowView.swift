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
        
		GroupBox {
			VStack(alignment: .leading, spacing: 4) {
				HStack (alignment: .top) {
				Text(job.title)
					.font(.headline)
					.foregroundStyle(.primary)
					
				Spacer()
					
				Text(job.companyName)
					.foregroundStyle(.secondary)
					.font(.headline)
			}
				
				Divider()
				
			
				Text(job.description)
					.foregroundColor(.secondary)
					.padding(.top)
			}
			.padding(.vertical, 4)
		}
    }
}
