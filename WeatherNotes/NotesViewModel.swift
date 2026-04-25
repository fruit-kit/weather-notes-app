//
//  NotesViewModel.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import Foundation
import Combine

final class NotesViewModel: ObservableObject {
    
    @Published var notes = [Note]()
    
    func addNote(title: String, text: String) {
        let note: Note = Note(title: title,
                              text: text,
                              date: Date(),
                              temperature: 18,
                              weatherDescription: "Sunny",
                              icon: "sun.max.fill")
        notes.append(note)
    }
    
}
