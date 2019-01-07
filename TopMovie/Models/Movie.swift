//
//  Movie.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

class AllMovies {
    static var movies = [Movie]()
}

class Movie {
    var id: Int?
    var video: Bool?
    var adult: Bool?
    var title: String?
    var voteCount: Int?
    var genretIds: [Int]?
    var overview: String?
    var voteAverage: Double?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var backdropPath: String?
    var originalTitle: String?
    var originalLanguage: String?
}

extension Movie {
    static func setData(with dict: dictionary, success: @escaping( Success )) {
        if let results = dict["results"] as? [dictionary] {
            for result in results {
                let movie = Movie()
                
                movie.id = result["id"] as? Int
                movie.video = result["video"] as? Bool
                movie.adult = result["adult"] as? Bool
                movie.title = result["title"] as? String
                movie.voteCount = result["vote_count"] as? Int
                movie.overview = result["overview"] as? String
                movie.genretIds = result["genre_ids"] as? [Int]
                movie.popularity = result["popularity"] as? Double
                movie.voteAverage = result["vote_average"] as? Double
                movie.posterPath = result["poster_path"] as? String
                movie.releaseDate = result["release_date"] as? String
                movie.backdropPath = result["backdrop_path"] as? String
                movie.originalTitle = result["original_title"] as? String
                movie.originalLanguage = result["original_language"] as? String
                
                AllMovies.movies.append(movie)
            }
            success()
        }
    }
}
