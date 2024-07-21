//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by 최승범 on 7/20/24.
//

import Foundation

final class PokemonDetailViewModel {
    
    var name: String
    var firstType: PokemonType?
    var secondType: PokemonType?
    var imageString: String
    
    private let weight: Double
    private let height: Double
    var ability: String
    
    var hp: Int = 0
    var attack: Int = 0
    var deffense: Int = 0
    var specialAttack: Int = 0
    var specialDeffense: Int = 0
    var speed: Int = 0
    
    
    
    init(pokemon: PokemonDTO) {
        
        name = pokemon.name
        
        if !pokemon.types.isEmpty {
            firstType = PokemonType(rawValue: pokemon.types[0].type.name)
        }
        
        if pokemon.types.count >= 2 {
            secondType = PokemonType(rawValue: pokemon.types[1].type.name)
        }
        
        imageString = pokemon.sprites.other.officialArtWork.frontDefault
        
        weight = pokemon.weight / 10
        height = pokemon.height / 10
        
        ability = pokemon.abilities.isEmpty ? "없음" : pokemon.abilities[0].ability.name
        
        if !pokemon.stats.isEmpty {
            hp = pokemon.stats[0].baseStat
            attack = pokemon.stats[1].baseStat
            deffense = pokemon.stats[2].baseStat
            specialAttack = pokemon.stats[3].baseStat
            specialDeffense = pokemon.stats[4].baseStat
            speed = pokemon.stats[5].baseStat
        }
    }
    
    
    func pokemonWeight() -> String {
        return weight.formatedNoneZero() + " kg"
    }
    
    func pokemonHeight() -> String {
        return height.formatedNoneZero() + " m"
    }
}
