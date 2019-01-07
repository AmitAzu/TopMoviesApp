//
//  Controllers.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

class Controllers {
    static func performSegue(with vc: UIViewController, delay: Int, identifier: Identifiers, sender: Any?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            vc.performSegue(withIdentifier: identifier.rawValue, sender: sender)
        }
    }
}
