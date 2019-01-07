//
//  SplashVC.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet var playImageCollection: [UIImageView]!
    
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //------------------------
        //MARK: welcome to this vc
        //------------------------
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //-------------------------------------------------
        //MARK: when the view Layout Subviews get in posion
        //-------------------------------------------------
        Animation.oneAfterOneAnimation(with: playImageCollection)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for pageNum in 1...5{
            group.enter()
            NetworkManager.getApiData(with: pageNum) {
                self.group.leave()
            }
            group.wait()
        }
        
        Controllers.performSegue(with: self, delay: 2, identifier: .toMain, sender: nil)
        Animation.hideOneAfterOne()
    }
}

