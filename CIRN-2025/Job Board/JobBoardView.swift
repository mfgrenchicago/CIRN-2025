//
//  JobBoardView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/16/25.
//

import SwiftUI

struct JobBoardView: View {
    let jobs = [
           "Chicago Steel Works",
           "Urban Metals Inc.",
           "West Side Gears",
           "Lakeview Tool & Die",
           "Midwest Fabrication Co."
       ]
       
       var body: some View {
           List {
               ForEach(jobs, id: \.self) { job in
                   Text(job)
               }
           }
       }
   }

   #Preview {
       JobBoardView()
   }
