//
//  PokemonDTO.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation

struct PokemonDTO: Decodable {
    let id: Int
    let name: String
    let heght: Int
    let weight: Int
    let sprites: [Sprite]
    let types: [PokemonTypeDTO]
}

struct PokemonTypeDTO: Decodable {
    let slot: Int
    let type: [PokedexListNamedElementDTO]
}

struct Sprite: Decodable {
    let front_default: String
    let front_shiny: String
    let front_female: String
    let front_shiny_female: String
}

