//
//  ManufacturingCompaniesView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/16/25.
//

import SwiftUI

struct ManufacturingCompaniesView: View {
    
    var viewModel: ManufacturingViewModel
    
    var body: some View {
       
        NavigationStack {
            //edits the information from the struct
                List (viewModel.companys) { company in
                    NavigationLink {
                        ManufacturingCompaniesDetailsView(company: company)
                    } label: {
                        ManufacturingCompanyRowView(company: company)
                    }

                }
            //adds a title on the top left corner.
                .navigationTitle("Manufacturers")
            }

        }
    }
#Preview {
    ManufacturingCompaniesView(viewModel: ManufacturingViewModel())
}
