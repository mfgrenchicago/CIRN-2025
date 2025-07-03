//
//  MembershipViewModel.swift
//  CIRN-2025
//
//  Created by - on 6/24/25.
//

import SwiftUI

struct MembershipView: View {
	
	var viewModel: MembershipViewModel
	var body: some View {
		NavigationStack {
			CustomWebView(websiteType: .membership)
				.navigationTitle(Text("Membership"))
		}
	}
}

#Preview {
	MembershipView(viewModel: MembershipViewModel())
}
