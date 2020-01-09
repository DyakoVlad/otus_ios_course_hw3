//
//  Colors.swift
//  SegmentedControl
//
//  Created by Vladislav Dyakov on 08.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import UIKit
import SwiftUI

extension UIColor {
    
    static let sunflower = UIColor(rgb: 0xFFC312)
    static let radiantYellow = UIColor(rgb: 0xF79F1F)
    static let puffinsBill = UIColor(rgb: 0xEE5A24)
    static let redPigment = UIColor(rgb: 0xEE5A24)
    static let energos = UIColor(rgb: 0xC4E538)
    static let androidGreen = UIColor(rgb: 0xF79F1F)
    static let pixelatedGrass = UIColor(rgb: 0x009432)
    static let turkishAqua = UIColor(rgb: 0x006266)
    static let blueMartina = UIColor(rgb: 0x12CBC4)
    static let middeterareanSea = UIColor(rgb: 0x1289A7)
    static let merchantMarineBlue = UIColor(rgb: 0x0652DD)
    static let leaguesUnderTheSea = UIColor(rgb: 0x1B1464)
    static let lavenderRose = UIColor(rgb: 0xFDA7DF)
    static let lavenderTea = UIColor(rgb: 0xFFC312)
    static let forgottenPurple = UIColor(rgb: 0x9980FA)
    static let curcumorbitalRing = UIColor(rgb: 0x5758BB)
    static let baraRed = UIColor(rgb: 0xEE5A24)
    static let veryBerry = UIColor(rgb: 0xEE5A24)
    static let hollyhock = UIColor(rgb: 0xF79F1F)
    static let magentaPurple = UIColor(rgb: 0x6F1E51)
    
    static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

