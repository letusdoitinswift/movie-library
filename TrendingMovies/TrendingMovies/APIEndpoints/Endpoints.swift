//
//  Endpoints.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import Foundation

struct Endpoint {
    // Domain
    static let baseURL = "https://api.themoviedb.org/3/"
    
    // Image Endpoint
    static var fileWidthPortrait = "w300"
    static var fileWidthLarge = "w780"
    static var fileWidthOriginal = "original"
    static var poster_path = "1E5baAaEse26fej7uHcjOgEE2t2.jpg"
    static var portraitImageBaseURL = "https://image.tmdb.org/t/p/\(fileWidthPortrait)/"
    static var largeImageBaseURL = "https://image.tmdb.org/t/p/\(fileWidthLarge)/"
    static var originalImageBaseURL = "https://image.tmdb.org/t/p/\(fileWidthOriginal)/"

    // Movie List
    static var toFetchMoviesLists = baseURL + "account/\(accountId)/lists?page=\(movieListPageNum)"
    static var movieListPageNum = 1
    
    static var toFetchMovieListFromListId = baseURL + "list/\(listId)?language=en-US&page=\(listPageNum)"
    static var listId = 0
    static var listPageNum = 1
    
    // Favorite List
    static var toFetchFavMovies = baseURL + "account/\(accountId)/favorite/movies"
    
    // Movie Details
    static var movieId = 1
    static var toFetchMovieDetails = baseURL + "movie/\(movieId)"
    
    // Add Favorites
    static var toFetchFavorites = baseURL + "account/\(accountId)/favorite"
    static let accountId = "21522978"
    
    private static var headers: [String: String] = {
        var dict = ["Authorization" : "\(AccessToken.instance.accessToken)",
                    "accept": "application/json"]
        return dict
    }()
    
    static func createRequest(endpoint: String, method: String,
                       body: [String: String]? = nil) -> URLRequest {
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method

        return request
    }
}
