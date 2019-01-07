//
//  MovieVC.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit
import SDWebImage
import MBCircularProgressBar

class MovieVC: UIViewController {
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var detailsTV: UITextView!
    
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    //----------------------------------------
    //MARK: movie object get value from MainVC
    var movie: Movie?
    //----------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateProgressBar()
    }
    
    private func animateProgressBar() {
        if let progressbar = movie?.voteAverage {
            let sumProgressbar = progressbar * 10.0
            UIView.animate(withDuration: 1.0) {
                self.progressView.value = CGFloat(sumProgressbar)
            }
        }
    }
    
    private func setInfo() {
        if let path = movie?.posterPath {
            let urlStr = "https://image.tmdb.org/t/p/w500\(path)"
            let url = URL(string: urlStr)
            movieImage.sd_setImage(with: url)
            self.movieImage.layer.masksToBounds = true
        }
        //------------------------------------------------
        let dateStr = movie?.releaseDate
        if let dates = dateStr?.date(format: "yyyy-MM-dd") {
            date.text = dates
        }
        //--------------------------------
        let details = movie?.overview
        let title = movie?.originalTitle
        //-------------------------------
        movieName.text = title
        detailsTV.text = details
    }
}
