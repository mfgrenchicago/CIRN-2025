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
                if true {
                    List (viewModel.apiCompanies) { company in
                        ManufacturingAPIRowView(company: company)
                    }
                } else {
                    List (viewModel.companys) { company in
                        ManufacturingCompanyRowView(company: company)
                    }
                }
            }
				//adds a title on the top left corner.
					.navigationTitle("Manufacturers")
			}
			.task {
				await viewModel.fetchManufacturers()
			}
            }

        }
#Preview {
	ManufacturingCompaniesView(viewModel: ManufacturingViewModel(apiService: ManufacturersAPIServiceImpl()))
}
