//
//  ModelData.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 1/30/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var placemarks: [Placemark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Placemark] {
        placemarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Placemark]] {
        Dictionary(grouping: placemarks, by: { $0.category.rawValue })
    }
}

var placemarks: [Placemark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Couldn't find \(filename) from main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
