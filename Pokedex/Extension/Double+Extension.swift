//
//  Double+Extension.swift
//  Pokedex
//
//  Created by 최승범 on 7/20/24.
//

import Foundation

extension Double {
    func formatedNoneZero() -> String {
        return String(format: "%.3g", self)
    }
}
