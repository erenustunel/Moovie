//
//  HomeViewModel.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import Foundation
import RxSwift

final class HomeViewModel {
        
    func getMovies() -> Observable<Movies> {
        return API.shared.getPopularMovies()
    }
}
