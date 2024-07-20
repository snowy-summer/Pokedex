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
    @Published var pokedex: PokedexDTO?
    @Published var pokemon = [PokemonDTO]()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        fetchPokedex()
    }
    
    private func fetchPokedex() {
        networkManager.fetchData(PokedexDTO.self,
                                 router: .pokedex(start: 1, end: 20))
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
            pokemon = [PokemonDTO](repeating: PokemonDTO(),
                                   count: dex.results.count)
            fetchAllPokemon()
        }
        .store(in: &cancellable)
    }
    
    private func fetchAllPokemon() {
        guard let pokedex = pokedex else { return }
               
               let dispatchGroup = DispatchGroup()
               
        for i in 1...pokedex.results.count {
                   dispatchGroup.enter()
                   fetchPokemon(id: i) {
                       dispatchGroup.leave()
                   }
               }
               
               dispatchGroup.notify(queue: .main) {
                   print("모든 포켓몬 데이터 가지고 옴")
               }
    }
    
    private func fetchPokemon(id: Int, completion: @escaping () -> Void) {
        networkManager.fetchData(PokemonDTO.self,
                                 router: .pokemon(dexNum: id))
        .sink { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            
        } receiveValue: { pokemon in
            self.pokemon[id - 1] = pokemon
            print(pokemon)
            completion()
        }
        .store(in: &cancellable)
    }
}
