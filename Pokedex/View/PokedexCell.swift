//
//  PokedexCell.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import SwiftUI

struct PokedexCell: View {
    let pokemon: PokemonModel
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            
            ZStack {
                VStack(alignment: .leading) {
            
                        Text(pokemon.name.capitalized)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                        
                    HStack(alignment: .bottom, spacing: 4) {
                                                
                        Image(pokemon.type[0].symbolName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.15, height: width * 0.15)
                            .padding(.leading, 16)
                            .padding(.bottom, 16)
                        
                        if pokemon.type.count >= 2 {
                            Image(pokemon.type[1].symbolName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.15, height: width * 0.15)
                                .padding(.bottom, 16)
                        }

                        
                        Spacer()
                        
                        Image("1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.4, height: width * 0.4)
                            .padding(.trailing, 16)
                            .offset(CGSize(width: 0, height: -8))
                    }
                    
                }
                .frame(width: width)
            }
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .green, radius: 6)
        }
        .frame(height: 120)
    }
}
#Preview {
    PokedexView()
//    PokedexCell(pokemon: PokemonModel(id: 0, name: "이상해씨", type: .grass))
}
