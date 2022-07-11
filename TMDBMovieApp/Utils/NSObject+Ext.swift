//
//  NSObject+Ext.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
