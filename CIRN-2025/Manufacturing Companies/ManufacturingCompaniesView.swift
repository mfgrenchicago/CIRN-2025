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
                //edits the information from the struc
                List (viewModel.companys) { company in
                    VStack(alignment: .leading) {
                        //bolds the company name
                        Text(company.name)
                            .bold()
                            //changes the information into a footnote/subscript and changes the color
                        Text(company.description)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(company.email)
                            .font(.footnote)
                            .foregroundColor(Color.blue)
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
