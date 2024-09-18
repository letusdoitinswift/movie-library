//
//  MovieListViewModel.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import Foundation

@MainActor
final class MovieListViewModel: ObservableObject {
    // List of the lists
    @Published var moviesLists: MoviesLists?
    
    // Contents from one list
    @Published var listOfMovies: Movies?
    
    @Published var errorMessage: String?
    
    init() {
        Task {
            await fetchMovieList()
        }
    }

    private func fetchMovieList() async {
        let moviesListsEndpoint = Endpoint.toFetchMoviesLists
        let request = Endpoint.createRequest(endpoint: moviesListsEndpoint, method: "GET")
        
        do {
            moviesLists = try await NetworkOperation<MoviesLists>().send(request: request)
            moviesLists?.results.forEach { list in
                Endpoint.listId = list.id
                let moviesEndpoint = Endpoint.toFetchMovieListFromListId
                let request = Endpoint.createRequest(endpoint: moviesEndpoint, method: "GET")
                Task {
                    listOfMovies = try await NetworkOperation<Movies>().send(request: request)
                }
            }
        } catch {
            self.errorMessage = "Something went wrong, please try again!"
            print("Something went wrong \(error)")
        }
    }
}
