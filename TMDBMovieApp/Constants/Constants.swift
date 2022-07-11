//
//  Constants.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import Foundation

final class Constants {
    
    static let shared = Constants()

    private init() {}

    let apiKey = "c8960316ba2d49f394f1561b20d1895c"
    let baseURL = "https://api.themoviedb.org/3"
    let imageURL = "https://image.tmdb.org/t/p/w300"
}
