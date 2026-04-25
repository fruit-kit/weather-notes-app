//
//  NotesViewModel.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import Foundation
import Combine

final class NotesViewModel: ObservableObject {
    
    @Published var notes: [Note] = [
        Note(title: "Title 1",
             text: "Some text 1",
             date: Date(),
             temperature: 18,
             weatherDescription: "Sunny",
             icon: "sun.max.fill"),
        Note(title: "Title 2",
             text: "Some text 2",
             date: Date(),
             temperature: 18,
             weatherDescription: "Sunny",
             icon: "sun.max.fill"),
        Note(title: "Title 3",
             text: "Some text 3",
             date: Date(),
             temperature: 18,
             weatherDescription: "Sunny",
             icon: "sun.max.fill")
    ]
    
}
