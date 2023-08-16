//
//  StringExtension.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/17.
//

import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return self[self.index(startIndex, offsetBy: index)]
    }
}
