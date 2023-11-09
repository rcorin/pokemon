//
//  ContentView.swift
//  Pokemon
//
//  Created by Ricardo CORIN on 11/9/23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewModel = PokemonesViewModel()
    var body: some View {
		NavigationStack {
			ZStack {
				List(viewModel.pokemones) { pokemon in
					NavigationLink(destination:
									Text(pokemon.name)
									) {
						Text(pokemon.name)
					}
				}
			}
			.navigationTitle("Pokemones")
			.task {
				if viewModel.pokemones.count == 0 {
					do {
						try await viewModel.cargarPokemones()
					} catch { }
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PokemonesViewModel())
    }
}
