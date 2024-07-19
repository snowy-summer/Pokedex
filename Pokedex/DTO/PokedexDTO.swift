//
//  PokedexDTO.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation

struct PokedexDTO: Decodable, Equatable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokedexListNamedElementDTO]
}
