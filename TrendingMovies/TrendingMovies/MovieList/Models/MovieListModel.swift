//
//  MovieListModel.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import Foundation

struct MoviesLists: Decodable {
    var page: Int
    var results: [Result]
    var total_pages: Int
    var total_results: Int
    struct Result: Decodable, Identifiable {
        let description: String
        var favorite_count: Int
        var id: Int
        let item_count: Int
        let iso_639_1: String
        let list_type: String
        let name: String
        var poster_path: String?
    }
}
