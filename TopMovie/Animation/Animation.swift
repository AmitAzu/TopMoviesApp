//
//  Animation.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

class Animation {
    //---------------------
    //MARK: local variables
    //---------------------
    static var timer: Timer?
}

extension Animation {
    //---------------------------
    //MARK: extension  variables
    //---------------------------
    static var index = 0
    static var imageCollection: [UIImageView]?
    
    static public func oneAfterOneAnimation(with imageCollection: [UIImageView]) {
        //------------------------------
        //MARK: start the animation func
        //------------------------------
        self.imageCollection = imageCollection
        
        timer = Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(startOneAfterOne), userInfo: nil, repeats: true)
    }
    
    @objc private static func startOneAfterOne() {
        //------------------------------------------
        //MARK: excute the animation with timer func
        //------------------------------------------
        UIView.animate(withDuration: 0.4) {
            if let imageCollection = imageCollection {
                if index == imageCollection.count { index = 0 }
                
                if imageCollection[index].alpha == 0 {
                    imageCollection[index].alpha = 1
                }else{
                    imageCollection[index].alpha = 0
                }
                
                index += 1
            }
        }
    }
    
    static public func hideOneAfterOne() {
        timer?.invalidate()
        imageCollection = nil
    }
}
