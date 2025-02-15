//
//  PokedexView.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import SwiftUI

struct PokedexView: View {
    
    @ObservedObject private var viewModel = PokedexViewModel()
    private let gridItems = GridItem(.flexible(), spacing: 16)
    
    var body: some View {
        ScrollView {
            let columns = Array(repeating: gridItems, count: 2)
            LazyVGrid(columns: columns, spacing: 16) {
                
                ForEach(viewModel.pokemons.indices, id: \.self) { index in
                    
                    let pokemon = viewModel.pokemons[index]
                    
                    NavigationLink(destination: PokemonDtailView(pokemon: pokemon)) {
                        PokedexCell(pokemon: pokemon)
                            .onAppear {
                                if index == viewModel.pokemons.count - 6 {
                                    viewModel.pageUpdate()
                                }
                            }
                    }
                }
                
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Pokedex")
    }
}

#Preview {
    PokedexView()
}
