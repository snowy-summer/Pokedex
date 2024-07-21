//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by 최승범 on 7/20/24.
//

import SwiftUI
import Combine

final class PokedexViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    private var pokedex: PokedexDTO?
    @Published var pokemons = [PokemonDTO]()
    private var cancellable = Set<AnyCancellable>()
    
    @Published private var startIndex = 0
    private let pageCount = 20
    
    init() {
        binding()
    }
    
    func pageUpdate() {
        startIndex += pageCount
    }
    
    private func binding() {
        $startIndex.sink {[weak self] _ in
            self?.fetchPokedex()
        }.store(in: &cancellable)
        
    }
    
    private func fetchPokedex() {
        networkManager.fetchData(PokedexDTO.self,
                                 router: .pokedex(start: startIndex,
                                                  pageCount: pageCount))
        .sink { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                break
            }
        } receiveValue: {[weak self] dex in
            guard let self = self else { return }
            pokedex = dex
            pokemons += [PokemonDTO](repeating: PokemonDTO(),
                                    count: dex.results.count)
            fetchPokemon(start: startIndex,
                         end: startIndex + dex.results.count)
        }
        .store(in: &cancellable)
    }
    
    private func fetchPokemon(start: Int, end: Int) {
        
        let dispatchGroup = DispatchGroup()
        
        for index in start...end {
            dispatchGroup.enter()
            fetchPokemon(id: index) {
                dispatchGroup.leave()
            }
        }
    }
    
    private func fetchPokemon(id: Int, completion: @escaping () -> Void) {
       let result = networkManager.fetchData(PokemonDTO.self,
                                 router: .pokemonInfo(dexNum: id))
        .combineLatest( networkManager.fetchData(PokemonSpeciesDTO.self,
                                                 router: .pokemonSpecies(dexNum: id)))
        .map { pokemon, species in
            let koreaName = species.names.first {
                $0.language.name == "ko"
            }
            return(pokemon: pokemon, name: koreaName?.name)
            
        }
        .eraseToAnyPublisher()
        
        result
        .sink { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            
        } receiveValue: { (pokemon, name) in
            self.pokemons[id - 1] = pokemon
            self.pokemons[id - 1].name = name ?? pokemon.name
            completion()
        }
        .store(in: &cancellable)
    }

}
