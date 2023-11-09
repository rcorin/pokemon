//
//  Pokemon.swift
//  Pokemon
//
//  Created by Ricardo CORIN on 11/9/23.
//

import Foundation

struct PokemonResult : Identifiable {
	var id: Int
	var name: String
	var urlString: String
}

struct MockData {
	static let pokemonesMock : [PokemonResult] = [ PokemonResult(id: 1, name: "bulbasaur", urlString: "https://pokeapi.co/api/v2/pokemon/1/"),
											PokemonResult(id: 2, name: "ivysaur", urlString: "https://pokeapi.co/api/v2/pokemon/2/"),
											PokemonResult(id: 3, name: "venusaur", urlString: "https://pokeapi.co/api/v2/pokemon/3/")
	]
}

