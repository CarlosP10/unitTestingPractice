//
//  CoveredClass.swift
//  CodeCoverage
//
//  Created by Carlos Paredes on 2/13/23.
//

import Foundation
import UIKit

class CoveredClass {
    static func max(_ x: Int, _ y: Int) -> Int {
        if x < y {
            return y
        } else {
            return x
        }
    }
}
