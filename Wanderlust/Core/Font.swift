//
//  Font.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/18/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import UIKit

// Default app font
/**
 Inter UI
 == InterUI-Italic
 == InterUI-Black
 == InterUI-SemiBold
 == InterUI-BoldItalic
 == InterUI-Bold
 == InterUI-SemiBoldItalic
 == InterUI-Medium
 == InterUI-Regular
 == InterUI-BlackItalic
 == InterUI-ExtraBoldItalic
 == InterUI-MediumItalic
 == InterUI-ExtraBold
 */
class Font {
    static func ofSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "InterUI-Regular", size: size)!
    }
}
