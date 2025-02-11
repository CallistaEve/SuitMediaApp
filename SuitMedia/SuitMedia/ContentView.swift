//
//  ContentView.swift
//  SuitMedia
//
//  Created by Evelyn Callista Yaurentius on 11/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            FirstScreen()
                .navigationTitle("First Screen")
        }
    }
}

#Preview {
    ContentView()
}
