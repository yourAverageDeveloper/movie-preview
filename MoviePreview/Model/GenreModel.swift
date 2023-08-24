//
//  GenreModel.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import Foundation
import Alamofire

//   let genreList = try? JSONDecoder().decode(GenreList.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseGenreList { response in
//     if let genreList = response.result.value {
//       ...
//     }
//   }

// MARK: - GenreList
struct GenreList: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
