//
//  MovieListView.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var vm = MovieListViewModel()
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 15) {
                    if let items = vm.listOfMovies?.items {
                        ForEach(items, id: \.self) { item in
                            LazyHStack {
                                NavigationLink {
                                    MovieInfoView(item: .constant(item))
                                } label: {
                                    VStack(alignment: .leading) {
                                        let url = URL(string: Endpoint.portraitImageBaseURL + (item.poster_path ?? ""))!
                                        PortraitViews(imageURL: url)
                                        Text(item.original_title)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .frame(width: 100, height: 50)
                                        HStack(spacing: 10) {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.yellow)
                                            Text("\(item.vote_count)")
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
