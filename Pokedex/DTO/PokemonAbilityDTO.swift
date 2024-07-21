//
//  PokemonAbilityDTO.swift
//  Pokedex
//
//  Created by 최승범 on 7/21/24.
//

import Foundation

struct PokemonAbilityDTO: Decodable {
    let englishName: String
    let names: [Name]
    
    enum CodingKeys: String, CodingKey {
        case englishName = "name"
        case names
    }
}
