//
//  ManufacturingCompaniesView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/16/25.
//

import SwiftUI

struct ManufacturingCompaniesView: View {
	
	@StateObject var viewModel: ManufacturingViewModel
	
	var body: some View {
		
		NavigationStack {
			VStack {
				
				List (viewModel.companies) { company in
					NavigationLink {
						ManufacturingCompaniesDetailsView(viewModel: ManufacturingDetailsViewModel(company: company))
					} label: {
						ManufacturingCompanyRowView(company: company)
					}
					.listRowSeparator(.hidden)
				}
				.listStyle(.plain)
				.navigationTitle("Manufacturers")
				
			}
			.task {
				if viewModel.companies.isEmpty {
					await viewModel.fetchManufacturers()
				}
				
			}
			.refreshable {
				await viewModel.fetchManufacturers()
			}
			.alert(isPresented: $viewModel.showErrorAlert, content: {
				Alert(title: Text(viewModel.errorMessage))
			})
			.overlay {
				if viewModel.isLoading {
					ProgressView(LocalizedStringKey("Fetching Manufacturers.."))
						.controlSize(.extraLarge)
				}
			}
		}
		
	}
}
#Preview {
	ManufacturingCompaniesView(viewModel: ManufacturingViewModel(apiService: ManufacturersAPIServiceImpl()))
}
