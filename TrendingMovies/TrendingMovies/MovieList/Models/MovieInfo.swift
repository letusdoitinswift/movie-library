//
//  MovieInfo.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import Foundation

struct MovieInfo: Decodable, Identifiable {
    var adult: Bool
    var backdrop_path: String?
    var belongs_to_collection: BelongsToCollection?
    struct BelongsToCollection: Decodable, Identifiable {
        let id: Int
        let name: String
        let poster_path: String
        let backdrop_path: String
    }
    let budget: Int
    var genres: [Genre]
    
    struct Genre: Decodable, Identifiable, Hashable {
        let id: Int
        let name: String
    }
    let homepage: String
    let id: Int
    let imdb_id: String
    let original_language: String
    let original_title: String
    let overview: String
    var popularity: Double
    var poster_path: String?
    var production_companies: [Company]
    
    struct Company: Decodable, Identifiable {
        let id: Int
        var logo_path: String?
        let name: String
        let origin_country: String
    }
    let production_countries: [ProdCountry]
    
    struct ProdCountry: Decodable {
        let iso_3166_1: String
        let name: String
    }
    
    var release_date: String
    var revenue: Int
    var runtime: Int
    var spoken_languages: [SpokenLang]
    struct SpokenLang: Decodable {
        let english_name: String
        let iso_639_1: String
        let name: String
    }

    var status: String
    var tagline: String
    let title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
}
