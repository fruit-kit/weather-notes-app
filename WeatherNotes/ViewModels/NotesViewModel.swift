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
    
    func addNote(title: String, text: String) {
        
        Task {
            do {
                let service = WeatherService()
                let weather = try await service.fetchWeather()

                let note = Note(title: title,
                                text: text,
                                date: Date(),
                                temperature: Int(weather.temperature),
                                weatherDescription: weather.description,
                                icon: "sun.max.fill")
                
                self.notes.append(note)
                
            } catch {
                print("Weather error:", error)
            }
        }
    }
}
