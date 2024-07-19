//
//  PokedexCell.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import SwiftUI

struct PokedexCell: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("이상해씨")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                
                HStack(alignment: .bottom) {
                    Text("독")
                        .font(.subheadline).bold()
                        .foregroundStyle(.white)
                        .frame(width: 100,
                               height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .padding([.leading, .bottom], 16)
                    
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68,
                               height: 68)
                        .padding([.horizontal, .bottom], 8)
                }
            }
            
        }
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color:.green ,radius: 6)
    }
}

#Preview {
    PokedexCell()
}
