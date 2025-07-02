//
//  SwiftUIView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 7/2/25.
//
import SwiftUI

struct SupportWebView: View {
    var body: some View {
        NavigationStack {
            CustomWebView(url: URL(string: "https://mfgren.my.site.com/ewintake/")!)
                .navigationTitle("Support")
        }
    }
}

#Preview {
    SupportWebView()
}
