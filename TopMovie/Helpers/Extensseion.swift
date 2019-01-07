//
//  Extensseion.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

extension String {
    func date(format: String) -> String? {
        //---------------------------------------
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        //---------------------------------------
        let currentFormat = DateFormatter()
        currentFormat.dateFormat = "MM/dd/yyyy"
        let str = currentFormat.string(from: date!)
        //---------------------------------------
        return str
    }
}

