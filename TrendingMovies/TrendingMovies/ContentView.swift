//
//  ContentView.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                MovieListView()
            }
            .padding()
            .navigationTitle("Movies' List")
        }
    }
}

#Preview {
    ContentView()
}
