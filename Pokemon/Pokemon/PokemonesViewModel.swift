//
//  PokemonesViewModel.swift
//  Pokemon
//
//  Created by Ricardo CORIN on 11/9/23.
//

import Foundation
import Combine

struct PokemonAPI : Codable {
	var name: String
	var url: String
	var id: Int? {
		let idSearch = /https\:\/\/pokeapi.co\/api\/v2\/pokemon\/(\d+)\//
		if let xid = try? idSearch.wholeMatch(in: url) {
			return Int(xid.1)
		} else {
			return nil
		}
	}
}

struct PokemonesAPI : Codable {
	var count: Int
	var next: String?
	var previous: String?
	var results: [PokemonAPI]
}

enum PokemonAPIError: Error {
	case InvalidURL
	case InvalidResponse
}

final class PokemonesViewModel : ObservableObject {
	@Published var pokemones = [Pokemon]()
	@Published var isLoading = false
	
	private var cancelable: AnyCancellable?
	private static let sessionProcessingQueue = DispatchQueue(label: "SessionProcessingQueue")

	func cargarPokemones() async throws {
		guard let url = URL(string:"https://pokeapi.co/api/v2/pokemon?limit=10&offset=0") else { throw PokemonAPIError.InvalidURL }
		
		cancelable = URLSession.shared.dataTaskPublisher(for: url)
			.subscribe(on: Self.sessionProcessingQueue)
			.map({
				return $0.data
			})
			.decode(type: PokemonesAPI.self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { (suscriberCompletion) in

				switch suscriberCompletion {
				case .finished:
					break
				case .failure(let error):
					print(error)
				}
			}, receiveValue: { [weak self] (pokemonesAPI) in
				self!.isLoading = false

				for pokemonAPI in pokemonesAPI.results {
					guard let id = pokemonAPI.id else { continue }
					let pokemon = Pokemon(id: id, name: pokemonAPI.name, urlString: pokemonAPI.url)
					if !self!.pokemones.contains(pokemon) {
						self!.pokemones.append(pokemon)
					}
				}
			})
	}
	
	func cancel(){
		cancelable?.cancel()
	}
	
	
}
