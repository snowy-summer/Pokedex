//
//  PokemonDtailView.swift
//  Pokedex
//
//  Created by 최승범 on 7/20/24.
//

import SwiftUI
import Kingfisher

struct PokemonDtailView: View {
    
    private let viewModel: PokemonDetailViewModel
    
    init(pokemon: PokemonDTO) {
        self.viewModel = PokemonDetailViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        ZStack {
            viewModel.firstType?.color
                .edgesIgnoringSafeArea(.all)
            VStack() {
                headerView
                PokemonInfoView(viewModel: viewModel)
                    .padding(.horizontal, 8)
            }
            pokemonImage
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
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
            KFImage(URL(string: viewModel.imageString))
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Spacer()
        }
        .padding()
    }
    
}

fileprivate struct PokemonInfoView: View {
    
    private let viewModel: PokemonDetailViewModel
    
    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                Text(viewModel.name)
                    .font(.title)
                    .bold()
                HStack {
                    if let firstType = viewModel.firstType {
                        pokemonTypeSymbol(width: 40, type: firstType)
                    }
                    
                    if let secondType = viewModel.secondType {
                        pokemonTypeSymbol(width: 40, type: secondType)
                    }
                }
                .padding()
                
                headLine(text: "세부 정보")
                    .padding(.bottom)
                pokemonAttributesView
                    .padding(.bottom)
                headLine(text: "종족값")
                    .padding(.bottom)
                statsView
            }
            
        }
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 2)
        
    }
    
    private func headLine(text: String) -> some View {
        Text(text)
            .font(.headline)
            .foregroundStyle(viewModel.firstType?.color ?? .black)
            .bold()
    }
    
    private func pokemonTypeSymbol(width: CGFloat,
                                   type: PokemonType) -> some View {
        
        Image(type.symbolName)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: width)
    }
    
    private var pokemonAttributesView: some View {
        HStack {
            weightView
                .padding()
            
            Divider()
                .frame(width: 2, height: 100)
                .background(Color(.lightGray.withAlphaComponent(0.4)))
            
            heightView
                .padding()
            
            Divider()
                .frame(width: 2, height: 100)
                .background(Color(.lightGray.withAlphaComponent(0.4)))
            
            abilityView
                .padding()
        }
    }
    
    private var weightView: some View {
        VStack {
            Text(viewModel.pokemonWeight())
                .padding()
            Text("무게")
                .font(.caption2)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    private var heightView: some View {
        VStack {
            Text(viewModel.pokemonHeight())
                .padding()
            Text("키")
                .font(.caption2)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    private var abilityView: some View {
        VStack {
            Text("\(viewModel.ability)")
                .padding()
            Text("특성")
                .font(.caption2)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    private var statsView: some View {
        VStack(spacing: 0) {
            statView(name: "체력", value: viewModel.hp)
            statView(name: "공격", value: viewModel.attack)
            statView(name: "방어", value: viewModel.deffense)
            statView(name: "특공", value: viewModel.specialAttack)
            statView(name: "특방", value: viewModel.specialDeffense)
            statView(name: "속도", value: viewModel.speed)
        }
    }
    
    private func statView(name: String, value: Int) -> some View {
        HStack {
            Text(name)
            Divider()
                .frame(width: 2, height: 24)
                .background(Color(.lightGray.withAlphaComponent(0.4)))
            
            Text("\(value)")
            ProgressView(value: Double(value) / 300)
                .tint(viewModel.firstType?.color)
        }.padding(.horizontal)
    }
}

#Preview {
    PokemonDtailView(pokemon: PokemonDTO(id: 1,
                                         name: "이상해씨",
                                         height: 0.7,
                                         weight: 6.9,
                                         types: [
                                            PokemonTypeDTO(slot: 1, type: .init(name: "grass")),
                                            PokemonTypeDTO(slot: 1, type: .init(name: "poison"))
                                                ],
                                         sprites: Sprite(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", other: OtherImages(officialArtWork: OfficialArtWork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"))),
                                         stats: [
                                            PokemonStat(baseStat: 45, statName: PokemonStatName(name: "hp")),
                                            PokemonStat(baseStat: 45, statName: PokemonStatName(name: "hp")),
                                            PokemonStat(baseStat: 45, statName: PokemonStatName(name: "hp")),
                                            PokemonStat(baseStat: 45, statName: PokemonStatName(name: "hp")),
                                            PokemonStat(baseStat: 45, statName: PokemonStatName(name: "hp")),
                                            PokemonStat(baseStat: 45, statName: PokemonStatName(name: "hp")),
                                                ],
                                         abilities: [
                                            PokemonAbility(ability: Ability(name: "신록"), isHidden: true)
                                         ]))
}
