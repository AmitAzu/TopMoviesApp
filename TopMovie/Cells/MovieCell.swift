//
//  MovieCell.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Movie? {
        didSet {
            setInfo()
        }
    }
    
    private func setInfo() {
        if let title = movie?.title {
            movieTitle.text = title
        }
        
        if let path = movie?.posterPath {
            let urlStr = "https://image.tmdb.org/t/p/w500\(path)"
            let url = URL(string: urlStr)
            movieImage.sd_setImage(with: url)
        }
    }
}

