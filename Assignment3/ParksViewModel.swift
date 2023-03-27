//
//  ParksViewModel.swift
//  Assignment3
//
//  Created by Shane Peek on 3/25/23.
//

import Foundation

class ParksViewModel : ObservableObject {
    @Published private(set) var parksData = [ParkModel]()
    @Published var hasError = false
    @Published var error : ParkModelError?
    
    private let url = "https://developer.nps.gov/api/v1/parks?limit=20&api_key=Z9AAIC6a0j9Ml4TFgK5gQbLsGowU1H2ikzdHZF41"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(ParkResults?.self, from: data)
                else {
                    self.hasError.toggle()
                    self.error = ParkModelError.decodeError
                    return
                }
                self.parksData = results.data
            } catch {
                self.hasError.toggle()
                self.error = ParkModelError.customError(error: error)
            }
        }
    }
}

extension ParksViewModel {
    enum ParkModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
                case .decodeError:
                    return "Decoding Error"
                case .customError(let error):
                    return error.localizedDescription
            }
        }
    }
}
