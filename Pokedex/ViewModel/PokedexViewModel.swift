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
        
        dispatchGroup.notify(queue: .main) {
            print("모든 포켓몬 데이터 가지고 옴")
        }
    }
    
    private func fetchPokemon(id: Int, completion: @escaping () -> Void) {
        networkManager.fetchData(PokemonDTO.self,
                                 router: .pokemonInfo(dexNum: id))
        .sink { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            
        } receiveValue: { pokemon in
            self.pokemons[id - 1] = pokemon
            completion()
        }
        .store(in: &cancellable)
    }
    
    private func fetchPokemonKoreaName(id: Int, completion: @escaping () -> Void) {
        networkManager.fetchData(PokemonSpeciesDTO.self,
                                 router: .pokemonInfo(dexNum: id))
        .sink { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            
        } receiveValue: { pokemon in
            
           
            let pokemonNames = pokemon.names.filter {
                $0.name == "ko"
            }
            if pokemonNames.isEmpty { return }
            let pokemonName = pokemonNames[0].name
            
            self.pokemons[id - 1].name = pokemonName
            completion()
        }
        .store(in: &cancellable)
    }
}
