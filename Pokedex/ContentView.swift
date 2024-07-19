//
//  ContentView.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import SwiftUI
import Combine
import Alamofire

struct ContentView: View {
    @State private var cancellable = Set<AnyCancellable>()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        .padding()
        .onAppear {
//            NetworkManager().fetchData(PokedexDTO.self, router: .pokedex(start: 0, end: 10))
//                .sink { error in
//                    print(error)
//                } receiveValue: { PokedexDTO in
////                    dump(PokedexDTO)
//                }.store(in: &cancellable)

        }
    }
}

#Preview {
    ContentView()
}
