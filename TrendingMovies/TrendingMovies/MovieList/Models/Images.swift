//
//  Images.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/18/24.
//

import Foundation

struct Images: Decodable {
    let base_url: String
    let secure_base_url: String
    var backdropSizes: [String]
    var logo_sizes: [String]
    var poster_sizes: [String]
    var profile_sizes: [String]
    var still_sizes: [String]
    var change_keys: [String]
}
