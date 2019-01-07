//
//  IBDesignableView.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

@IBDesignable class IBDesignableView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
}

