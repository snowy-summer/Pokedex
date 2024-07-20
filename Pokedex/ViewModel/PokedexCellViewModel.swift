//
//  PokedexCellViewModel.swift
//  Pokedex
//
//  Created by 최승범 on 7/20/24.
//

import SwiftUI

final class PokedexCellViewModel: ObservableObject {
    
    @Published var name: String
    @Published var firstType: PokemonType?
    @Published var secondType: PokemonType?
    @Published var imageString: String
    
    init(pokemon: PokemonDTO) {
        
        name = pokemon.name
        
        if !pokemon.types.isEmpty {
            firstType = PokemonType(rawValue: pokemon.types[0].type.name)
        }
        
        if pokemon.types.count >= 2 {
            secondType = PokemonType(rawValue: pokemon.types[1].type.name)
        }
        
        imageString = pokemon.sprites.other.officialArtWork.frontDefault
            
    }
    
}
