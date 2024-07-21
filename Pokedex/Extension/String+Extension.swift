//
//  String+Extension.swift
//  Pokedex
//
//  Created by 최승범 on 7/21/24.
//

import Foundation

extension String {
    var isKorean: Bool {
        for scalar in self.unicodeScalars {
            if scalar.value >= 0xAC00 && scalar.value <= 0xD7A3 {
                return true
            }
        }
        return false
    }
}
