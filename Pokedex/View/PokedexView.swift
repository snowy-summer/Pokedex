//
//  PokedexView.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = GridItem(.flexible(), spacing: 16)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                let columns = Array(repeating: gridItems, count: 2)
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(mockPokemon.indices) { pokemon in
                        PokedexCell(pokemon: mockPokemon[pokemon])
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}
