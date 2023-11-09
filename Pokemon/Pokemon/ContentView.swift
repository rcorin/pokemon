//
//  ContentView.swift
//  Pokemon
//
//  Created by Ricardo CORIN on 11/9/23.
//

import SwiftUI

struct ContentView: View {
	var pokemones : [PokemonResult] = MockData.pokemonesMock
    var body: some View {
		NavigationStack {
			ZStack {
				List(pokemones) { pokemon in
					NavigationLink(destination:
									Text(pokemon.name)
									) {
						Text(pokemon.name)
					}
				}
			}
			.navigationTitle("Pokemones")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
