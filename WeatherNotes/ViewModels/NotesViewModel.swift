//
//  NotesViewModel.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import Foundation
import Combine

final class NotesViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    let notesStorageService = NotesStorageService()
    
    init() {
        notes = notesStorageService.fetchNotes()
    }
    
    func addNote(title: String, text: String) {
        
        Task {
            do {
                let service = WeatherService()
                let weather = try await service.fetchWeather()

                let note = Note(id: UUID(),
                                title: title,
                                text: text,
                                date: Date(),
                                temperature: Int(weather.temperature),
                                weatherDescription: weather.description,
                                icon: mapWeatherIcon(weather.icon))
                
                notesStorageService.save(note: note)
                
                self.notes.insert(note, at: 0)
                
            } catch {
                print("Weather error:", error.localizedDescription)
                
                let note = Note(id: UUID(),
                                title: title,
                                text: text,
                                date: Date(),
                                temperature: 0,
                                weatherDescription: "No data",
                                icon: "questionmark.circle")
                
                notesStorageService.save(note: note)
                
                self.notes.insert(note, at: 0)
            }
        }
    }
    
    func mapWeatherIcon(_ icon: String) -> String {
        switch icon {
        case "01d": 
            return "sun.max.fill"
        case "01n": 
            return "moon.fill"
        case "02d", "02n": 
            return "cloud.sun.fill"
        case "03d", "03n", "04d", "04n":
            return "cloud.fill"
        case "09d", "09n", "10d", "10n":
            return "cloud.rain.fill"
        case "11d", "11n":
            return "cloud.bolt.fill"
        case "13d", "13n":
            return "snowflake"
        case "50d", "50n":
            return "cloud.fog.fill"
        default:
            return "questionmark.circle"
        }
    }
}
