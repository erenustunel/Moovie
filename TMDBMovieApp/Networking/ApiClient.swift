//
//  ApiClient.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import Foundation
import Alamofire
import RxSwift

final class API {
    
    static let shared = API()
    
    private init() {}
    
    func getPopularMovies() -> Observable<Movies> {
        
        let url = Constants.shared.baseURL + "/movie/popular"
        let parameters: Parameters = [
            "api_key": Constants.shared.apiKey
        ]
        
        return Observable.create { observer in
            
            AF.request(url, method: .get,
                       parameters: parameters,
                       encoding: URLEncoding(destination: .queryString)).response { (response) in
                if let data = response.data {
                    do {
                        let movie = try JSONDecoder.init().decode(Movies.self, from: data)
                        observer.onNext(movie)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                }
            }
            return Disposables.create()
        }
    }
}
