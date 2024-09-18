//
//  Movie.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import Foundation

struct Movies: Decodable, Identifiable {
    var created_by: String
    var description: String
    var favorite_count: Int
    var id: Int
    var iso_639_1: String
    var item_count: Int
    var items: [MovieItem]
    let name: String
    var page: Int
    var poster_path: String?
    var total_pages: Int
    var total_results: Int
}

struct MovieItem: Decodable, Identifiable, Hashable {
    var backdrop_path: String
    var id: Int
    var title: String
    var original_title: String
    var overview: String
    var poster_path: String?
    var media_type: String
    var adult: Bool = false
    var original_language: String
    var genre_ids: [Int]
    var popularity: Double
    var release_date: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
}

