//
//  PokedexCell.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import SwiftUI
import Kingfisher

struct PokedexCell: View {
    
   @ObservedObject private var viewModel: PokedexCellViewModel
    
    init(pokemon: PokemonDTO) {
        viewModel = PokedexCellViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width

            ZStack {
                VStack(alignment: .leading) {
                    pokemonName
                    pokemonTypesAndImage(width: width)
                }
                .padding([.top, .leading], 16)
                .frame(width: width)
            }
            .background(viewModel.firstType?.color ?? .clear)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: viewModel.firstType?.color ?? .clear,
                    radius: 6)
        }
        .frame(height: 120)
    }
    
    private var pokemonName: some View {
        Text(viewModel.name.capitalized)
            .font(.headline)
            .foregroundColor(.white)
    }
    
    private func pokemonTypesAndImage(width: CGFloat) -> some View {
        HStack(alignment: .bottom, spacing: 4) {
            pokemonDoubleType(width: width)
            Spacer()
            pokemonImage(width: width,
                         sprite: viewModel.imageString)
        }
    }
    
    private func pokemonDoubleType(width: CGFloat) -> some View {
        Group {
            
            if let firstType = viewModel.firstType {
                pokemonType(width: width, type: firstType)
            }
            
            if let secondType = viewModel.secondType {
                pokemonType(width: width, type: secondType)
            }
        }
    }
    
    private func pokemonType(width: CGFloat,
                             type: PokemonType) -> some View {
        
        Image(type.symbolName)
            .resizable()
            .scaledToFit()
            .frame(width: width * 0.15, height: width * 0.15)
            .padding(.bottom, 16)
    }
    
    private func pokemonImage(width: CGFloat,
                              sprite: String) -> some View {
        KFImage(URL(string: sprite))
            .cancelOnDisappear(true)
            .resizable()
            .scaledToFit()
            .frame(width: width * 0.4, height: width * 0.4)
            .padding(.trailing, 16)
            .padding(.bottom, 8)
    }
}
#Preview {
    PokedexView()
    //    PokedexCell(pokemon: PokemonModel(id: 0, name: "이상해씨", type: .grass))
}

