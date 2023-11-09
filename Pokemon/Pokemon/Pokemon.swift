//
//  Pokemon.swift
//  Pokemon
//
//  Created by Ricardo CORIN on 11/9/23.
//

import Foundation

struct Pokemon : Identifiable, Equatable {
	var id: Int
	var name: String
	var urlString: String
}

struct MockData {
	static let pokemonesMock : [Pokemon] = [ Pokemon(id: 1, name: "bulbasaur", urlString: "https://pokeapi.co/api/v2/pokemon/1/"),
											Pokemon(id: 2, name: "ivysaur", urlString: "https://pokeapi.co/api/v2/pokemon/2/"),
											Pokemon(id: 3, name: "venusaur", urlString: "https://pokeapi.co/api/v2/pokemon/3/")
	]
}

