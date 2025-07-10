//
//  AboutUsView.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 7/2/25.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        NavigationStack {
            CustomWebView(url: URL(string: "https://www.mfgren.org/cirn/")!)
                .navigationTitle("About Us")
        }
    }
}

