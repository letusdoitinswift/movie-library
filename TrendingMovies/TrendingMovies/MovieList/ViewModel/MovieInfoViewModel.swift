//
//  MovieInfoViewModel.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/18/24.
//

import Foundation

@MainActor
class MovieInfoViewModel: ObservableObject {
    @Published var movieInfo: MovieInfo?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchMovieInfo(movieId: Int) async {
        Endpoint.movieId = movieId
        let endpoint = Endpoint.toFetchMovieDetails
        let request =  Endpoint.createRequest(endpoint: endpoint, method: "GET")
        
        isLoading = true
        errorMessage = nil
        do {
            movieInfo = try await NetworkOperation<MovieInfo>().send(request: request)
        } catch {
            errorMessage = "Something went wrong, please try again!"
        }
    }
}
