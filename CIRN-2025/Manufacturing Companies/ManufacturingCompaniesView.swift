    //
    //  ManufacturingCompaniesView.swift
    //  CIRN-2025
    //
    //  Created by Amado Perez - on 6/16/25.
    //

    import SwiftUI

    struct ManufacturingCompaniesView: View {
        //struck that creates a variable that could store multiple infromation inside
        //Allowing to add multiple things in one line
        struct Company: Identifiable {
            let id = UUID()
            let name: String
            let description: String
            let email: String
        }
        //added information into the variable/struck
        @State var companys: [Company] = [
            Company(name: "Company", description: "++++", email: "Contact info"),
            Company(name: "Archer-Daniels-Midland Company", description: "++++", email: "Contact info"),
            Company(name: "AbbVie Inc.", description: "++++", email: "Contact info"),
            Company(name: "Mondelez International, Inc.", description: "++++", email: "Contact info"),
            Company(name: "GE HealthCare Technologies Inc.", description: "++++", email: "Contact info")
            ]
        
        
        var body: some View {
            NavigationStack {
                //edits the information from the struc
                List (companys) { company in
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
                //adds a title on the top left corner.
    }
    #Preview {
        ManufacturingCompaniesView()
    }
