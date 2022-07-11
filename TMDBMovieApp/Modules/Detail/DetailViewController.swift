//
//  DetailViewController.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import UIKit
import RxSwift
import Kingfisher

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var disposeBag = DisposeBag()
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI(movies: movie)
    }
    
    func configureUI(movies: Movie?) {
        if let title = movies?.title {
            titleLabel.text = title
        }

        if let overView = movies?.synopsis {
            textView.text = overView
        }

        if let imageURL = movies?.image {
            imageView.kf.setImage(with: URL(string: Constants.shared.imageURL + imageURL))
        }
    }
}
