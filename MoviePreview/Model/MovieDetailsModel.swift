//
//  MovieDetailsModel.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

//   let movieDetails = try? JSONDecoder().decode(MovieDetails.self, from: jsonData)

import Foundation

// MARK: - MovieDetails
struct MovieDetails: Codable {
    var adult: Bool
    var backdropPath: String
    var budget: Int
    var genres: [Genre]
    var homepage: String
    var id: Int
    var imdbID, originalLanguage, originalTitle, overview: String
    var popularity: Double
    var posterPath, releaseDate: String
    var revenue, runtime: Int
    var status, tagline, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime, status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
