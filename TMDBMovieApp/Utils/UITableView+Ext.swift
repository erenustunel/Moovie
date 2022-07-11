//
//  UITableView+Ext.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCells(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            register(nibFromClass(cell), forCellReuseIdentifier: cell.nameOfClass)
        }
    }

    fileprivate func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.nameOfClass, bundle: nil)
    }
}
