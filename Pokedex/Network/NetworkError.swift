//
//  NetworkError.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    
    case invalidURL
    case invalidResponse
    
    var description: String {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다"
        case .invalidResponse:
            return "잘못된 응답입니다"
        }
    }
}
