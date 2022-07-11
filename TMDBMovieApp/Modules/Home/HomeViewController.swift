//
//  HomeViewController.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var disposeBag = DisposeBag()
    private let viewModel = HomeViewModel()
    private var movies = BehaviorRelay<[Movie]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
        registerTableView()
        displayMovies()
    }
}

private extension HomeViewController {
    func displayMovies() {
        spinnerStart()
        return viewModel.getMovies()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    guard let self = self else { return }
                    self.movies.accept(movies.moviesList)
                }, onError: { error in
                    self.showAlert(title: "Hata", message: "Hata")
                }, onCompleted: {spinnerStop()}).disposed(by: disposeBag)
    }
    
    func registerTableView() {
        tableView?.registerCells([HomeTableViewCell.self])
    }
    
    func bindTableView() {
        movies.bind(to: tableView.rx.items(cellIdentifier: HomeTableViewCell.nameOfClass, cellType: HomeTableViewCell.self)) { (row, item, cell) in
            cell.setupCell(movie: item)
           }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else {return}
            let vc = DetailViewController(nibName: DetailViewController.nameOfClass, bundle: nil)
            vc.movie = self.movies.value[indexPath.row]
            self.animateNavigate(vc: vc)
         }).disposed(by: disposeBag)
    }
}
