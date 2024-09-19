//
//  MovieInfoView.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/18/24.
//

import SwiftUI

struct MovieInfoView: View {
    var imageURL: URL {
        let url = Endpoint.originalImageBaseURL + (item.poster_path ?? "")
        return URL(string: url)!
    }
    @Binding var item: MovieItem
    @StateObject private var viewModel = MovieInfoViewModel()
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else {
                    VStack {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .frame(maxWidth: 300, maxHeight: 300)
                                .scaledToFit()
                                
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 300, maxHeight: 300)
                        }
                        Spacer()
                        VStack {
                            Text(item.title).font(.title).fontWeight(.bold)
                            Text(viewModel.movieInfo?.tagline ?? "").font(.caption2).italic()
                            VStack(alignment: .leading) {
                                Text("Overview").font(.subheadline).italic()
                                Text(viewModel.movieInfo?.overview ?? "No Overview present")
                                HStack(spacing: 10) {
                                    Text("Release Date:").font(.subheadline).italic()
                                    Text(viewModel.movieInfo?.release_date ?? "No Release Date available")
                                }
                                HStack(alignment: .top) {
                                    Text("Genre:").font(.subheadline).italic()
                                        ForEach(viewModel.movieInfo?.genres ?? [], id: \.self) { genre in
                                                Text("\(genre.name)")
                                    }
                                    
                                }
                                HStack(spacing: 5) {
                                    Text("Run Time:").font(.subheadline).italic()
                                    Text("\(viewModel.movieInfo?.runtime ?? 0) mins")
                                }
                                
                            }.padding()
                        }
                    }
                }
                Spacer()
            }.task {
                await viewModel.fetchMovieInfo(movieId: item.id)
                viewModel.isLoading = false
            }
        }
    }
}
