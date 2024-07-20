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
        NavigationStack {
            ScrollView {
                let columns = Array(repeating: gridItems, count: 2)
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(viewModel.pokemon) { pokemon in
                        PokedexCell(pokemon: pokemon)
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
