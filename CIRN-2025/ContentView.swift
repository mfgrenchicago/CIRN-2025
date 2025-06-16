//
//  ContentView.swift
//  CIRN-2025
//
//  Created by Pauline Lake on 6/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, DPI Interns")
            
            Button {
                
            } label: {
                Text("Press Me")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
