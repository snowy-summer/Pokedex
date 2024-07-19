//
//  PokemonModel.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import Foundation

struct PokemonModel {
    let id: Int
    let name: String
    let type: [PokemonType]
}


let mockPokemon: [PokemonModel] = [
    .init(id: 1, name: "이상해씨", type: [.grass, .poison]),
    .init(id: 2, name: "이상해풀", type: [.grass]),
    .init(id: 3, name: "이상해꽃", type: [.grass]),
    .init(id: 4, name: "꼬북이", type: [.water]),
    .init(id: 5, name: "어니부기", type: [.water]),
    .init(id: 6, name: "거북왕", type: [.water]),
    .init(id: 7, name: "파이리", type: [.fire])
]
