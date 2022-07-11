//
//  HomeTableViewCell.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var moviePointLabel: UILabel!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(movie: Movie) {
        movieNameLabel.text = movie.title
        moviePointLabel.text = "\(movie.voteAverage)"
    }
}
