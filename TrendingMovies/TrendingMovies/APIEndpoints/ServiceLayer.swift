//
//  ServiceLayer.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/17/24.
//

import Foundation
import Combine


enum CustomError: Error {
    case badResponse
    case requestFailed
    case requestTimedOut
    case networkFailure
}

final class NetworkOperation<T: Decodable> {
    var errorMessage: CustomError = .networkFailure
    func send(request: URLRequest) async throws -> T? {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let value = try JSONDecoder().decode(T.self, from: data)
            return value
        } catch {
            self.errorMessage = .badResponse
            print("Something went wrong \(error) for request: \(request)")
        }
        return nil
    }
}
