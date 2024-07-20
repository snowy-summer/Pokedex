//
//  PokemonDtailView.swift
//  Pokedex
//
//  Created by 최승범 on 7/20/24.
//

import SwiftUI

struct PokemonDtailView: View {
    
    private var headerView: some View {
        HStack {
            Spacer()
            Image(.pokeball)
                .padding(.trailing, 16)
                .opacity(0.2)
        }
    }
    
    private var pokemonImage: some View {
        VStack {
            Image("1")
            Spacer()
        }
        .padding()
    }
    
    var body: some View {
        ZStack {
            VStack() {
                headerView
                PokemonInfoView()
                    .padding(.horizontal, 8)
            }
            pokemonImage
        }
        .background(Color.green)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct PokemonInfoView: View {
    var body: some View {
        ZStack {
            Color(.white)
                VStack {
                    HStack {
                        Image(.grassSymbol)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Image(.poisonSymbol)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .padding()
                    
                    headLine(text: "세부 정보")
                        .padding(.bottom)
                    PokemonAttributesView()
                        .padding(.bottom)
                    headLine(text: "종족값")
                        .padding(.bottom)
                    StatsView()
                    
                    
                }
            
        }
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 2)
        
    }
    
    private func headLine(text: String) -> some View {
        Text(text)
            .font(.headline)
            .foregroundStyle(Color.green)
            .bold()
    }
    
    private func pokemonType(width: CGFloat,
                             type: PokemonType) -> some View {
        
        Image(type.symbolName)
            .resizable()
            .scaledToFit()
            .frame(width: width * 0.15, height: width * 0.15)
            .padding(.bottom, 16)
    }
    
}

struct PokemonAttributesView: View {
    var body: some View {
        HStack {
            information(name: "무게", value: 6.9)
                .padding()
            Divider()
                .frame(height: 100)
            information(name: "무게", value: 6.9)
                .padding()
            Divider()
                .frame(height: 100)
            information(name: "무게", value: 6.9)
                .padding()
        }
    }
    
    private func information(name: String, value: Double) -> some View {
        VStack {
            Text("6.9 kg")
                .padding()
            Text("무게")
                .font(.caption2)
                .foregroundStyle(Color(.lightGray))
        }
    }
   
}

struct StatsView: View {
    var body: some View {
        VStack(spacing: 0) {
            statView(name: "체력", value: 45)
            statView(name: "공격", value: 49)
            statView(name: "방어", value: 49)
            statView(name: "특공", value: 65)
            statView(name: "특방", value: 65)
            statView(name: "속도", value: 45)
        }
    }
   
    private func statView(name: String, value: Double) -> some View {
        HStack {
            Text(name)
            Divider()
                .frame(width: 2, height: 24)
                .background(Color(.lightGray.withAlphaComponent(0.4)))
                
            Text("\(Int(value))")
            ProgressView(value: value / 300)
                .tint(.green)
        }.padding(.horizontal)
    }
}

#Preview {
    PokemonDtailView()
}
